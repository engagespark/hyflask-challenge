(require flaskdsl)

(flaskdsl.Server
 "hello!"

 ;; This would be more beautiful with keyword arguments:
 ;;
 ;; :host "0.0.0.0"
 ;; :port 8000
 ;;
 ;; Unfortunately, hypy doesn't support them in macros yet.
 ;; It's possible to parse the argument list, but … nah. :p

 "0.0.0.0"
 8000

 ("/" "Hello World! Please POST to /fortune")

 ("/fortune" [POST] "You'll be happy forever!"))
