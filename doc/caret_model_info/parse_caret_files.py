import re, os

class cModelInfo:

    def __init__(self):
        self.reset()
        pass

    def reset(self):
        self.mMethod = ""
        self.mLabel = "" # label = "Logic Regression",
        self.mLibraries = [] # library = "LogicReg" or library = c("adabag", "plyr"),
        self.mTypes = [] # type = c('Regression', 'Classification')
        self.mTags = [] # tags = c("Logic Regression", "Linear Classifier", "Linear Regression", "Logistic Regression", "Two Class Only", "Binary Predictors Only"),
        

    def parse_list(self, r_string_form):
        list1 = r_string_form.split(",")
        out = []
        for k in list1:
            k1 = k.replace("'" , "").replace("(" , "").replace(")" , "").replace("," , "").replace('"' , '')
            k1 = re.sub('^\s+' , '',  k1)
            out = out + [k1]
        return out
    
    def read_from_file(self, filename):
        self.reset()
        content = None
        self.mMethod = os.path.basename(filename).replace(".R" , "")
        with open(filename) as f:
            content = f.readlines()
        for line in content:
            line1 = re.sub('^\s+' , '',  line)
            if(line1.startswith('modelInfo <- list(label')):
                line2 = line1.replace("modelInfo <- list(label =", "")[:-1]
                if(line2 != "NULL"):
                    line2 = line2.replace('"', '')                    
                    self.mLabel = line2[1:-1]
                else:
                    assert(0)
                    self.mLabel = None
                pass
            if(self.mLabel == "" and line1.startswith('label =')):
                line2 = line1.replace("label =", "")[:-1]
                if(line2 != "NULL"):
                    line2 = line2.replace('"', '')                    
                    self.mLabel = line2[:-2]
                else:
                    assert(0)
                    self.mLabel = None
                pass
            if(line1.startswith('library = ')):
                line2 = line1.replace("library = ", "")[:-2]
                if(line2 != "NULL"):
                    line2 = re.sub('^\s+' , '',  line2)
                    if(line2.startswith('c(')):
                        self.mLibraries = self.parse_list(line2[1:])
                        pass
                    else:
                        self.mLibraries = [line2[1:-1]]
                else:
                    self.mLibraries = []
                pass
            if(self.mTypes == [] and line1.startswith('type = ')):
                if(line1.startswith('type = c')):
                    line2 = line1.replace("type = c", "")[:-2]
                    self.mTypes = self.parse_list(line2)
                    pass
                else:
                    line2 = line1.replace("type = ", "")[:-2]
                    self.mTypes = [line2[1:-1]]
                    
            if(line1.startswith('tags = ')):
                if(line1.startswith('tags = c')):
                    line2 = line1.replace("tags = c", "")[:-2]
                    self.mTags = self.parse_list(line2)
                    pass
                else:
                    line2 = line1.replace("tags = ", "")[:-2]
                    self.mTags = [line2[1:-1]]


            
def test1():
    mi = cModelInfo()
    mi.read_from_file("models/files/glm.R")
    print(mi.__dict__)

# test1()

import pandas as pd

def test2():
    content = None
    model_libraries = set()
    model_types = set()
    model_tags = set()
    data = []
    with open("caret_model_list.txt") as f:
        content = f.readlines()
    for fn in content:
        mi = cModelInfo()
        mi.read_from_file(fn[:-1])
        print(mi.__dict__)
        data = data + [mi]
        for l in mi.mLibraries:
            model_libraries.add(l)
        for t in mi.mTypes:
            model_types.add(t)
        for tag in mi.mTags:
            model_tags.add(tag)

    rows = []
    for mi in data:
        row = [mi.mMethod , mi.mLabel]
        for l in model_libraries:
            row = row + [(1 if(l in mi.mLibraries) else None)]
        for t in model_types:
            row = row + [(1 if(t in mi.mTypes) else None)]
        for tag in model_tags:
            row = row + [(1 if(tag in mi.mTags) else None)]
        rows = rows + [row]
    cols = ["Method" , "Label"]
    cols = cols + ["lib_" + l for l in model_libraries]
    cols = cols + ["type_" + t for t in model_types]
    cols = cols + ["tag_" + tag for tag in model_tags]
    df = pd.DataFrame(rows , columns=cols)
    return df

def test3():
    df = test2()
    print(df.head())
    print(df.describe())
    for col in df.columns:
        print("COLUMN_INFO" , "'" + col + "'" , list(df[col].unique()))
    df.to_csv("caret_model_infos_detailed.csv")
    
test3()
