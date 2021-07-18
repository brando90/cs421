type 'a list =
  | Nil
  | Cons of 'a * ('a list);;

Nil;;
Cons (1, Nil);; (* [1] 1::Nil *)
Cons (1, Cons(2, Nil));;

(* Polymorphism / parametric polymorphism 

'a is a type variable
*)

type 'a alist =
| ANil 
| ACons  of 'a * ('a alist);;

type 't tlist =
| TNil
| TCons  of 't * ('t tlist);;

TNil;;
