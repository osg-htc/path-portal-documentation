---
ospool:
  path: software_examples/r/tutorial-spills-R/README.md
path:
  path: 
---
# Analyzing .csv Chemical Spills Datasets 
### <i>An OSPool Tutorial</i>

Spills of hazardous materials, like petroleum, mercury, and battery acid, that can impact water and land quality are required to be reported to the United State's government by law. In this tutorial, we will analyze records provided by the state of New York on occurances of spills of hazardous materials that occured from 1950 to 2019.

The data used in this tutorial was collected from [https://catalog.data.gov/dataset/spill-incidents/resource/a8f9d3c8-c3fa-4ca1-a97a-55e55ca6f8c0](https://catalog.data.gov/dataset/spill-incidents/resource/a8f9d3c8-c3fa-4ca1-a97a-55e55ca6f8c0) and modified for teaching purposes. 

To access all of the materials to complete this tutorial, first log into your OSPool access point and run the following command: `git clone https://github.com/OSGConnect/tutorial-spills-R/`.

## Step 1: Get to Know Hazardous Spills Dataset

Let's explore the data files that we will be analyzing. Before we do so, we must make sure we are in the tutorial directory (`tutorial-spills-R/`). We can do this by printing your working directory (`pwd`): 


```bash
pwd
```

We should see something similar to `/home/jovyan/tutorial-spills-R/`, where `jovyan` could alternatively be your OSG account username. 

Next, let's navigate to our `/data` directory and list (`ls`) the files inside of it: 


```bash
cd data/
```


```bash
ls
```

We should see seven `.csv` files, one for each decade between 1950-2019.

To explore the contents of these files, we can use commands like `head -n 5 <fileName>` to view the first 5 lines of our data files. 


```bash
head -n 5 spills_1980_1989.csv  
```

<span style="color:blue">We can also use the navigation bar on the left side of your notebook to double-click and open each comma seperated value ("csv") .csv file and see it in a table format, instead of a traditional command line rendering above.</span>

## Step 2: Prepare the R Executable

Next, we need to create an R script to anayze our datasets. An example of an R script can be found in our main tutorial directory, so let's navigate there: 


```bash
cd ../ # change directory to move one up
```


```bash
ls # list files
```


```bash
cat spill_calculation.r
```

Then let us print the contents of our executable script: 


```bash
cat spill_calculation.r
```

This script will read in different datasets as arguments and then will carry out summary statistics to print out the number of spills recorded per decade and the total size (in gallons) of the hazardous spills.

## Step 3: Prepare Portable Software

Some common software, like R, are provided by OSG using containers. Because of this, you do not need to install R yourself, you will just tell HTCondor what container to use for your jobs. Additionally, this tutorial just uses base-R and no special libraries, but if you need libraries (e.g., tidyverse, ggplot2) you can always install them in your R container. 

A list of containers and other software provided by OSG staff can be found on our website [https://portal.osg-htc.org/documentation/](https://portal.osg-htc.org/documentation/), along with resources for learning how to add libraries to your container. 

We will be using the R container for R 3.5.0, which is accessable under `/cvmfs/singularity.opensciencegrid.org/opensciencegrid/osgvo-r:3.5.0`, so we must make sure to tell HTCondor to fetch this container when starting each of our jobs. To learn how to tell HTCondor to do this, see below. 

## Step 4: Prepare and Submit an HTCondor Submit File for One Test Job

The HTCondor submit file tells the HTCondor how you would like your job to be run on your behalf.

For example, you should specify what executable you want run, if you want a container/the name of that container, the resources you would like available to your job, and any special requirements. 

### Step 4A: Prepare and Submit an HTCondor Submit File

A sample submit to analyze our smallest dataset, `spills_1950_1959.csv`, file might look like: 


```bash
cat R.submit
```

We can submit this job using `condor_submit <SubmitFile>`:


```bash
condor_submit R.submit
```

We can check on the status of our job in HTCondor's queue by running: 


```bash
condor_q
```

Once our job is done running, it will leave HTCondor's queue automatically. 

### Step 4B: Review Test Job Results

Once our job is done running, we can check the results by looking in our `output` folder: 


```bash
cat output/spills.out
```

We should see that from 1950-1959, New York recorded five spills that totalled less than 0 recorded gallons. 

## Step 5: Scale Out Your Workflow to Analyze Many Datasets

We just prepared and ran one job analyzing the `spills_1950_1959.csv` dataset! But now, we want to analyze the remaining 6 datasets. Luckily, HTCondor is very helpful when it comes to rapidly queueing many small jobs!

To do so, we will update our submit file to use the `queue <variable> from <list>` syntax. But before we do this, we need to create a list of the files we want to queue a job for:  


```bash
ls data > list_of_datasets.txt
```


```bash
cat list_of_datasets.txt
```

Great! Now we have a list of the files we want analyzed, where each file is on it's own seperate line. 

### Step 5A: Update submit file to queue a job for each dataset

Now, let's modify the queue line of our submit file to use the new queue syntax. For this, we can choose almost any variable name, so for simplicity, let's choose `dataset` such that we have `queue dataset from list_of_datasets.txt`. 

We can then call this new variable, `dataset`, elsewhere in our submit file by wrapping it with `$()` like so: `$(dataset)`. 

Our updated submit file might look like this: 


```bash
cat many-R.submit
```

### Step 5B: Submit Many Jobs

Now we can submit our new submit file using `condor_submit` again:


```bash
condor_submit many-R.submit
```

Notice that we have now queued 7 jobs using one submit file!

### Step 5C: Analysis Completed!

We can check on the status of our 7 jobs using `condor_q`:


```bash
condor_q
```

Once our jobs are done, we can also review our output files:


```bash
cat output/*.csv.out
```

In a few minutes, we were able to take our R script and run several jobs to analyze all of our real-world data. <i>Congratulations!</i>
