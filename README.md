# README

## Introduction

Upon reviewing the task question I decided to use ruby on rails. Ruby is not my first 
language but after reviewing the task requiring the background job, strong api development
and keeping everything under less than half a man-day, I decided that rails was the best
tool for the task.

## Decisions taken

### Background Job

For the background job I used sidekiq. To run the sidekiq job use:

bundle exec sidekiq -C config/sidekiq.yml

Redis is required for sidekiq

### Security

Using some form of security on the API such as a bearer token was going to drive me out 
of the recommended 3 hours duration so I decided to focus on the bare functionality of 
the system and intentionally overlooked this functionality.

### Database choice

Since I wanted to submit this project with a working database without hosting a proper one 
online , I decided to go for the bundled SQLLite database. This has it's own issues
and limitations. Concurrency is not very strong with SQLLite. I encountered issues when reading
from one table and concurrently writing into another. 

Executing this helps overcome concurrency issues with SQLLite.

ActiveRecord::Base.connection.execute("BEGIN TRANSACTION; END;")

Although within it's simplicity the code is quite production-ready, no production keys or credentials
were supplied. I found it useless given the database choice.

### Schema Changes

#### The paid column in the Orders table

A new column called paid was added to the orders table. This is used to mark which 
orders were disbursed so that they are not picked up again next time.

#### Disbursement Table

I introduced a new table that is populated from the WeeklyDisbursementWorker class. 
The worker reads from the Orders table; looks for completed orders which weren't paid 
(paid=false) and populates the disbursement table with calculated disbursement and 
linking to the order. This allows the worker to work independently and makes using the
api far easier by simply selecting and reading from this table. 

#### Indexing

One or more indices would need to be introduced to make accessing the tables especially 
the Disbursement (History) table performant. This wasn't introduced in this version 
because it was felt that the performance would be lost on the SQLLite database.  

#### Unit Tests

Unit tests were only introduced for the models and mostly to test for some of the 
validations. Minitest was used for unit tests and while they could definitely be more 
thorough, the effort was put on good programming practices.