[![Build Status](https://travis-ci.org/riseshia/lazyCat.svg?branch=master)](https://travis-ci.org/riseshia/lazyCat) [![Code Climate](https://codeclimate.com/github/riseshia/lazyCat/badges/gpa.svg)](https://codeclimate.com/github/riseshia/lazyCat) [![Code Coverage](https://codeclimate.com/github/riseshia/lazyCat/badges/coverage.svg)](https://codeclimate.com/github/riseshia/lazyCat/coverage)

# lazyCat

Gathering status of task via API and Provide a glance monitor.

## What is it doing?

lazyCat get api call and just report. That's all. Base on this simple action, you could check your all task such as crawl. Here is scenario:

 * Create Task on lazyCat and get Token.
 * attach post api script to report task result.
 * Set token, and write status code and some simple message will be sent.

That's all. The idea of this app is form the needs to handle tiny and many tasks that aren't related at once.

### API spec

The parameters should be given below when you call.

```
url: your_server/api
method: POST
params
- "token": "TOKEN OF YOUR TASK"
- "status": "ok"
- "message": "Some message you want to check"
```

 * all report considered to fail unless 'status' is 'ok'.
 * 'message' is optional.
 * response will be sent with echo of request via json, except token.

## Autherization

lazyCat only support Github OAuth, If you want to use your own, you need to get Github token at first. Check documentations from [here](https://developer.github.com/v3/oauth/).

## Setup

All setting is done with capistrano-puma. What you do is setup `deploy.rb` and environment files. one more, `application.yml`, please check '.example' file.

Finishing this configuration, you could deploy just as normal rails application!

## How to Contribute

Bug reports and pull requests are very welcome!

And please keep in mind this project try to abide by Rubocop, Codeclimate, Rails Best Practice when you send PR. XD
