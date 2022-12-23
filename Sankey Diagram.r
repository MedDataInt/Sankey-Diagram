###### Go MedData Insight
###### This is Sankey Diagram R code.

library(networkD3)
library(dplyr)

# Overlap 1

links <- data.frame(
  source = c("IL-6","FOXO3","Akt","CASP9","ER","FBXW7","FOXF2","FOXO1","MET","NF-kB","PR",
            "TCR","TNFA","TLR4","TOX3","Bax","Bcl-2","BRCA1","BRCA2","ADAMTS9","AKT3","Bcl-2",
            "Bim","BNIP3","CASP3","CASP9","MYC","DDR2","DNMT3A","FOXF2","GINS2","leptin","MCM3",
            "p27","Smad2","Smad3","STAT3","TIMP2"),
  target = c("BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC",
            "OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC"),
  value = c(6,3,2,2,2,2,2,2,2,2,2,2,2,2,2,1,1,3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1))


# Overlap 2
links = data.frame(
  source = c("FoxO signaling pathway","Proteoglycans in cancer","Prolactin signaling pathway","Apoptosis",
             "PI3K-Akt signaling pathway","T cell receptor signaling pathway","MAPK signaling pathway","Breast cancer",
             "HIF-1 signaling pathway","TNF signaling pathway","Focal adhesion","VEGF signaling pathway", 
             "Estrogen signaling pathway","MicroRNAs in cancer","mTOR signaling pathway","Adherens junction",
             "NF-kappa B signaling pathway","FoxO signaling pathway","PI3K-Akt signaling pathway","Apoptosis",
             "Prolactin signaling pathway","MAPK signaling pathway","TNF signaling pathway","HIF-1 signaling pathway",
             "Focal adhesion","MicroRNAs in cancer","VEGF signaling pathway","T cell receptor signaling pathway",
             "p53 signaling pathway","Adherens junction","Estrogen signaling pathway","mTOR signaling pathway",
             "Gap junction","NF-kappa B signaling pathway"),
  target = c("BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC",
             "OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC"),
  value = c(36,29,28,28,28,25,20,18,17,17,16,15,15,13,12,10,10,28,23,22,18,14,13,12,12,11,11,10,9,8,8,5,3,3))


# Overlap 3
links = data.frame(
  source = c("mir-21", 'mir-200', 'mir-155','mir-34','mir-125','mir-30','mir-221','mir-29','mir-27','mir-205','mir-146',
           'mir-10','mir-145','mir-124','mir-181','mir-26','mir-206','mir-9','mir-17','mir-182','mir-200','mir-21','mir-145','mir-29',
           'mir-34','mir-125','mir-199','mir-30','mir-214','mir-130','mir-148','mir-205','mir-23','mir-139','mir-193','mir-27','mir-133',
           'mir-146','mir-182','mir-196'),
  target = c("BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC","BC",'BC','BC',"BC",
           "OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC","OC"),
  value = c(143,131,97,93,72,64,58,52,51,50,49,45,44,42,36,35,33,33,32,32,
            70, 34,29,23,23,21,20,20,15,13,13,13,13,12,12,12,11,11,11,11))

# Overlap 4
links = data.frame(
  source = c("Proteoglycans in cancer", 'Focal adhesion', 'ErbB signaling pathway','PI3K-Akt signaling pathway','Apoptosis',
             "Apoptosis", "Cell adhesion molecules","Hippo signaling pathway","Notch signaling pathway","Transcriptional misregulation in cancer" ),
  target = c("BC","BC","BC","BC","BC","OC","OC","OC","OC","OC"),
  value = c(44.95078198,38.31425826,33.5559552,30.67366414,29.66554625,2.586700236,2.360513511,2.294992041,2.266802735,2.068033885))

# From these flows we need to create a node data frame: it lists every entities involved in the flow
nodes <- data.frame(
  name=c(as.character(links$source), 
         as.character(links$target)) %>% unique()
)

# With networkD3, connection must be provided using id, not using real name like in the links dataframe.. So we need to reformat it.
links$IDsource <- match(links$source, nodes$name)-1 
links$IDtarget <- match(links$target, nodes$name)-1

links$IDsource <- match(links$source, nodes$name)-1 
links$IDtarget <- match(links$target, nodes$name)-1
# Make the Network
p <- sankeyNetwork(Links = links, Nodes = nodes,
                   Source = "IDsource", Target = "IDtarget",
                   Value = "value", NodeID = "name", 
                   sinksRight=FALSE, fontSize = 14)
p
