# Set the path
path <- "/home/josephcrispell/Desktop/Research/Woodchester_CattleAndBadgers/NewAnalyses_22-03-18/InterSpeciesClusters/"

# Read in the sampled and in-contact animal life history information
table <- read.table(paste0(path, "sampledAnimalsLifeHistories_05-04-2018.txt"), header=TRUE, sep="\t", stringsAsFactors=FALSE)

# Get the animals associated with the clusters 
clusterAnimals <- table[grepl(table$Clusters, pattern="0|1|2|3|4") == TRUE & is.na(table$Isolates) == FALSE, ]
incontactAnimals <- table[grepl(table$Clusters, pattern="0|1|2|3|4") == TRUE & is.na(table$Isolates) == TRUE, ]

# Count number of positive cluster and in-contact badgers
nClusterBadgers <- length(which(clusterAnimals$Species == "BADGER"))
nInContactBadgers <- length(which(incontactAnimals$Species == "BADGER"))
nInContactPositiveBadgers <- length(which(incontactAnimals$Species == "BADGER" & is.na(incontactAnimals$DetectionDate) == FALSE))

# Count number of positive cluster and in-contact cattle
nClusterCattle <- length(which(clusterAnimals$Species == "COW"))
nInContactCattle <- length(which(incontactAnimals$Species == "COW"))
nInContactPositiveCattle <- length(which(incontactAnimals$Species == "COW" & is.na(incontactAnimals$CattleTestDates) == FALSE))
