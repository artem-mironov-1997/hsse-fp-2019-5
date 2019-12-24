package funsets
//2. Purely Functional Sets.
object FunSets {

  type Set = Int => Boolean

  def contains(s: Set, elem: Int): Boolean = s(elem)

  def singletonSet(elem: Int): Set = (x => x == elem)

  def union(s: Set, t: Set): Set = (x => contains(s,x) || contains(t,x))

  def intersect(s: Set, t: Set): Set = (x => contains(s,x) && contains(t,x))

  def diff(s: Set, t: Set): Set = (x => contains(s,x) && !contains(t,x))

  def filter(s: Set, p: Int => Boolean): Set = (x => contains(s,x) && p(x))

  val bound = 1000

  def forall(s: Set, p: Int => Boolean): Boolean = {
    def iter(a: Int): Boolean = {
      if (contains(s,a) && !p(a)) false
      else if(a > 1000) true
      else iter(a + 1)
    }
    iter(-1000)
  }

  def exists(s: Set, p: Int => Boolean): Boolean = !forall(s, x => !p(x))

  def map(s: Set, f: Int => Int): Set = (y => exists(s, x => y == f(x)))

  def toString(s: Set): String = {
    val xs = for (i <- -bound to bound if contains(s, i)) yield i
    xs.mkString("{", ",", "}")
  }

  def printSet(s: Set) {
    println(toString(s))
  }
}