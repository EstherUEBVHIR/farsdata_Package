# Test file of farsdata package:

library(FarsFinal)
library(readr)
library(dplyr)
library(tidyr)
library(magrittr)
library(maps)
library(graphics)
library(testthat)

# We test the make_filename function using testthat:

test_that("make_filename function test in 2013", {
    expect_equal(make_filename(2013), "accident_2013.csv.bz2")}
    
test_that("make_filename function test in 2014", {
    expect_equal(make_filename(2014), "accident_2014.csv.bz2")}
    
test_that("make_filename function test in 2015", {
    expect_equal(make_filename(2015), "accident_2015.csv.bz2")}

