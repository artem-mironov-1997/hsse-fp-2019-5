package funsets
import funsets.FunSets.toString

object Main extends App {
  import FunSets._
  val lhsEntrySet = singletonSet(1)
  val rhsEntrySet = singletonSet(2)
  val createdUnion = union(lhsEntrySet, rhsEntrySet)
  println(s"createdUnion: ${FunSets.toString(createdUnion)}")

}
