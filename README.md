# hyflask-challenge

A coding challenge with Flask and Hy.

## Intro

You'll know [Flask](http://flask.pocoo.org/), a “micro webdevelopment framework for Python”.
According [to its docs](http://flask.pocoo.org/docs/0.12/quickstart/#a-minimal-application), a minimal app would look like so:

```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, Python!'

app.run()
```

(Run [hellopython.py](hellopython.py) to test this.

That's nice. Let's look how this could look with [Hy](http://docs.hylang.org/en/stable/), a “wonderful dialect of Lisp that’s embedded in Python”.
Let's see how wonderful that looks:

```lisp
(import flask)

(setv app (flask.Flask "HelloWorld"))

#@((.route app "/")
   (defn hello-world []
     "Hello Hy!"))

(.run app)
```

(Run [hellohy.hy](hellohy.hy) to test this.)

Hmmmmmmmm. Not too beautiful, is it? The bigger, the uglier?

```lisp
(import flask)

(setv app (flask.Flask "HelloWorld"))

#@((.route app "/")
   (defn hello []
     "Hello World! Please POST to /fortune"))

#@((.route app "/fortune" :methods [ "POST" ])
   (defn fortune []
     "You'll be happy forever!"))

(.run app
      :host "0.0.0.0"
      :port (int 8000))
```

Not all beauty. But, hey, we're having a Lisp at our disposal, let's use it. What if it looked like this:

```lisp
#! /usr/bin/env hy
(Server
 "HelloWorld"

 "0.0.0.0"
 8000

 ("/" "Hello World! Please POST to /fortune")

 ("/fortune" [POST] "You'll be happy forever!"))
```

That code sits in [betterflask.hy](betterflask.hy).

## The mission

Implement `Server` in `flaskdsl.hy`. This should make `betterflask.hy` runnable without modification

## Remarks & Gotchas

* You might want to look into what LISP macros are, if you're not familiar with the concept.
* Hy do not support [keyword parameters for macros](https://github.com/hylang/hy/pull/960#issuecomment-148296324). :(
* You can't play with function objects in quoted expressions: Functions cannot currently be represented as HyObjects.
* The code intended code is fundamentally different from the Flask way in that it's a single expression. What are the drawbacks? How could a better DSL look like?
