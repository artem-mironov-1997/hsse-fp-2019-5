package funsets

object Main extends App {
  import FunSets._
  //println(contains(singletonSet(1), 1))
  println("helloworld")
  var s1: Set = union(singletonSet(1), singletonSet(2))
  var s2: Set = union(singletonSet(3), singletonSet(2))
  val fun: Int => Int = _ + 5
  printSet(s1) //{1,2}
  printSet(s2) // {2,3}
  printSet(intersect(s1,s2)) //{2}
  printSet(diff(s1,s2)) //{1}
  printSet(map(s1, fun)) //{6,7}

}
