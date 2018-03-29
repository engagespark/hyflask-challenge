(import flask)

(setv app (flask.Flask "HelloWorld"))

#@((.route app "/")
   (defn hello-world []
     "Hello World!"))

(.run app)
