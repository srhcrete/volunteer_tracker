# _Volunteer Tracker_

#### _Independent project implementing SQL in Ruby, 09.22.2017_

#### By _**Sarah Lindmar**_

## Description

_Application for non-profits that can track projects and volunteers. Projects can be viewed, added, deleted, and updated. Volunteers can be viewed, added, and assigned to projects._

## Specs

| Description        | Input           | Output  |
| ------------------ |:-------------:| -----:|
| Adds projects    | '[Add] Park Clean Up' | '[Park Clean Up] link' |
| Views project details  | 'click [Park Clean Up] link'     | 'project: Park Clean Up, details: pick up trash, replace wood planking on benches, replace all fencing and nets, remove invasive trees, '|
| Deletes projects    | '[Delete] Park Clean Up' | 'no link' |
| Updates projects    | '[Update] Park Clean Up name' | '[Park Renovation] link' |
| Adds volunteers    | '[Add] Paula Small' | '[Paula Small] link' |
| Views volunteer contact details  | click [Paula Small] link | 'name: Paula Small, number: (555) 987-7674' |
| Assigns volunteers to projects | '[Assign] Paula Small to Park Clean Up' | '[Paula Small] link in Projects view and [Park Clean Up] link in Paula Small view' |


## Setup/Installation Requirements

### To Test Locally

* _`git clone https://github.com/srhcrete/volunteer_tracker` into your desired directory._
* _`cd volunteer_tracker` in terminal._
* _`bundle` to install all required gems._
* _`rspec` to run the tests._
* _`ruby app.rb` will start the localhost server._
* _Open (http://localhost:4567/) in your favorite web browser._

### For a Live Version

_Visit ()_


## Known Bugs

_..._

## Technologies Used

_Ruby, SQL, Sinatra, Capybara, Heroku_


## Support and contact details

_If you have any comments or suggestions please make a contribution to my repository_

### License

*This project is licensed under the MIT license*

Copyright (c) 2017 **_Sarah Lindmar_**
