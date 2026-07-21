# 1. Re-create clean UTF-8 CSV files in the data directory
dir.create("data", showWarnings = FALSE)

measurements_csv <- "sample_id,biomarker_ng_ml
S001,8.9
S002,10.1
S003,9.4
S004,11.0
S005,9.8
S006,10.5
S007,11.7
S008,8.5
S009,10.8
S010,9.7
S011,12.1
S012,10.2
S013,12.6
S014,13.5
S015,14.2
S016,12.9
S017,15.1
S018,13.8
S019,16.0
S020,14.7
S021,15.3
S022,13.6
S023,16.2
S024,14.8
S025,17.4
S026,15.8
S027,16.9
S028,18.1
S029,17.2
S030,16.4"

metadata_csv <- "sample_id,group,sex,age,batch
S001,Control,F,26,B1
S002,Control,F,31,B1
S003,Control,F,34,B2
S004,Control,M,38,B1
S005,Control,F,42,B2
S006,Control,F,45,B1
S007,Control,M,48,B2
S008,Control,F,29,B1
S009,Control,M,51,B2
S010,Control,F,37,B1
S011,Control,M,55,B2
S012,Control,F,43,B1
S013,Control,M,57,B2
S014,Control,M,60,B1
S015,Control,M,63,B2
S016,Treatment,F,33,B2
S017,Treatment,M,39,B1
S018,Treatment,F,41,B2
S019,Treatment,M,46,B1
S020,Treatment,F,49,B2
S021,Treatment,M,53,B1
S022,Treatment,F,44,B2
S023,Treatment,M,58,B1
S024,Treatment,M,61,B2
S025,Treatment,M,65,B1
S026,Treatment,F,54,B2
S027,Treatment,M,67,B1
S028,Treatment,M,70,B2
S029,Treatment,M,62,B1
S030,Treatment,F,56,B2"

writeLines(measurements_csv, "data/measurements.csv")
writeLines(metadata_csv, "data/metadata.csv")

# 2. Read the clean CSV files
measurements <- read.csv("data/measurements.csv", stringsAsFactors = FALSE)
metadata     <- read.csv("data/metadata.csv", stringsAsFactors = FALSE)

# 3. Merge datasets on sample_id
data_merged <- merge(measurements, metadata, by = "sample_id")

# 4. Convert categorical variables to factors
data_merged$group <- factor(data_merged$group, levels = c("Control", "Treatment"))
data_merged$sex   <- factor(data_merged$sex, levels = c("F", "M"))
data_merged$batch <- factor(data_merged$batch)

# 5. Save processed data for downstream plotting
saveRDS(data_merged, file = "data/processed_data.rds")

print("SUCCESS: Clean files saved and processed_data.rds created!")