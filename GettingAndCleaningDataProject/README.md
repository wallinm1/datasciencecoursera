# Getting and Cleaning Data -- Course Project -- README

This README explains how the data was cleaned up using the `run_analysis.R` script. The script is "monolithic" in the sense that it downloads the files it needs and uses no external libraries. The only change that needs to be done is to alter the `setwd()`-command on the 4th line of the script to change the working directory to something that exists on the user's computer. After this change, running the script should generate the tidied dataset with the filename `tidyData.txt` into the working directory.

## Downloading the data

The data was downloaded within R with the `download.file()`-command into a file called `data.zip` inside the current working directory. The zip-file was then unzipped using `unzip()`, after which the zip-file was deleted using `file.remove()`. This workflow generates a directory called `UCI HAR Dataset` in the current working directory which contains all the necessary files.

## Reading the data

The files `X_train.txt`, `X_test.txt`, `y_train.txt`, `subject_train.txt`, `y_test.txt`, `subject_test.txt`, `activity_labels.txt` and `features.txt` were read into dataframes with corresponding names. 

## Processing the data

After reading the data, the feature names were transformed into valid names using R's `make.names()` with the feature name-vector of the features-dataframe as its parameter. These fixed feature names were then placed as the names of the dataframes `X_train.txt` and `X_test.txt`. 

After this, the y-labels from the `y_train` and `y_test`-frames were placed into a y-column into the `X_train` and `X_test`-dataframes. The subject-labels from `subject_train` and `subject_test` were also placed into a subject-column in the `X_train` and `X_test`-frames. With the y-labels present, I merged the X-dataframes with the `activity_labels`-dataframe to map the y-labels to the corresponding activity strings. By placing both the y-labels and the subject-labels into the X-frames before merging on the string labels, I could ensure that the reordering caused by the merge-operation does not shuffle up the measurements and labels.

## Merging the data

After these steps, I could merge the `X_train.txt` and `X_test.txt`-dataframes into a new `df`-dataframe with R's `rbind`-command. After merging, I also dropped the y-label from the merged dataframe as it is no longer needed as the string labels were already mapped onto the frame.

## Choosing variables to keep

The appropriate column names were extracted using R's `grep`-command. As suggested in the instructions, I picked all column names which contained the terms `mean` or `std` into a `keep`-vector using the command using `grep`. With this approach, we get a few elements which contain `meanFreq`-terms, which are not wanted. These were removed with another `grep`-call. All in all, the desired columns were filtered from the merged merged `df`-dataframe with the following snippet:

```r
keep <- grep("(mean)|(std)",names(df),value=TRUE)
rem <- grep(("freq"),keep,ignore.case=TRUE)
keep <- keep[-rem]
keep <- c(keep, "subject", "activity")
df <- df[,keep]
```

## Aggregating

After completing the previously outlined steps, we have a merged `df`-dataframe with 10299 rows and 68 columns. With the `aggregate`-command, I took the groupwise mean of the numeric variables with respect to the two categorical columns (`subject` and `activity`), ordered the resulting dataframe on the subject and activity, and then wrote the resulting dataframe to disk with `write.table()`. The code snippet for achieving this is below.

```r
agg <- aggregate(. ~ subject + activity, data = df, FUN = mean)
agg <- agg[with(agg, order(subject, activity)),]
write.table(agg, "tidyData.txt", row.names=FALSE)
```
The `run_analysis.R` also contains an alternative approach to aggregating the `df`-dataframe using the `reshape2`-package and its `melt`- and `dcast`-functions. This was mostly done as a cross-evaluation and has been commented out from the code.

## Tidiness
To conclude the README, we validate the tidiness of the processed dataset.

Tidiness criteria:

1. Each variable you measure should be in one column
2. Each different observation of that variable should be in a different row
3. There should be one table for each "kind" of variable
4. If you have multiple tables, they should include a column in the table that allows them to be linked

Fulfillment of criteria:

1. Each of the 66 numeric columns measures one particular average, the subject column states the subject and the activity column states the activity for that particular row.
2. Each row contains an observation for one subject/activity-pair
3. The tidied dataset consists of one single table
4. The tidied dataset consists of one single table
