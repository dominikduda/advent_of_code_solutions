### All problems are taken form [Advent of Code](http://adventofcode.com/) made by [Eric Wastl](http://was.tl/).

>Advent of Code is a series of small programming puzzles for a variety of skill levels. They are self-contained and are just as appropriate for an expert who wants to stay sharp as they are for a beginner who is just learning to code. Each puzzle calls upon different skills and has two parts that build on a theme.

In case content of site mentioned above would change or disappear for whatever reason, I'm pasting here versions of problems I was working with.


All solutions are made in ruby 2.2.3.

#### Solved problems list: [day 1](#day-1), [day 2](#day-2)

---
### Day 1:
##### Not Quite Lisp

Santa is trying to deliver presents in a large apartment building, but he can't find the right floor - the directions he got are a little confusing. He starts on the ground floor (floor **0**) and then follows the instructions one character at a time.

An opening parenthesis, **(**, means he should go up one floor, and a closing parenthesis, **)**, means he should go down one floor.

The apartment building is very tall, and the basement is very deep; he will never find the top or bottom floors.

For example:
* **(())** and **()()** both result in floor **0**.
* **(((** and **(()(()(** both result in floor **3**.
* **))(((((** also results in floor **3**.
* **())** and **))(** both result in floor **-1** (the first basement level).
* **)))** and **)())())** both result in floor **-3**.

To what floor do the instructions take Santa?

**--- Part Two ---**

Now, given the same instructions, find the position of the first character that causes him to enter the basement (floor **-1**). The first character in the instructions has position **1**, the second character has position **2**, and so on.

For example:
* **)** causes him to enter the basement at character position **1**.
* **()())** causes him to enter the basement at character position **5**.

What is the position of the character that causes Santa to first enter the basement?

[See this problem on Advent of Code](http://adventofcode.com/day/1) | [See my part one solution (.rb)](https://github.com/dominikduda/advent_of_code_solutions/blob/master/solutions/day_1_part_one.rb) | [See my part two solution (.rb)](https://github.com/dominikduda/advent_of_code_solutions/blob/master/solutions/day_1_part_two.rb)

---
### Day 2:
##### I Was Told There Would Be No Math

The elves are running low on wrapping paper, and so they need to submit an order for more. They have a list of the dimensions (length **l**, width **w**, and height **h**) of each present, and only want to order exactly as much as they need.

Fortunately, every present is a box (a perfect right rectangular prism), which makes calculating the required wrapping paper for each gift a little easier: find the surface area of the box, which is **2×l×w + 2×w×h + 2×h×l**. The elves also need a little extra paper for each present: the area of the smallest side.

For example:
* A present with dimensions **2x3x4** requires **2×6 + 2×12 + 2×8 = 52** square feet of wrapping paper plus **6** square feet of slack, for a total of **58** square feet.
* A present with dimensions **1x1x10** requires **2×1 + 2×10 + 2×10 = 42** square feet of wrapping paper plus **1** square foot of slack, for a total of **43** square feet.

All numbers in the elves' list are in feet. How many total square feet of wrapping paper should they order?

**--- Part Two ---**

The elves are also running low on ribbon. Ribbon is all the same width, so they only have to worry about the length they need to order, which they would again like to be exact.

The ribbon required to wrap a present is the shortest distance around its sides, or the smallest perimeter of any one face. Each present also requires a bow made out of ribbon as well; the feet of ribbon required for the perfect bow is equal to the cubic feet of volume of the present. Don't ask how they tie the bow, though; they'll never tell.

For example:
* A present with dimensions **2x3x4** requires **2+2+3+3 = 10** feet of ribbon to wrap the present plus **2×3×4 = 24** feet of ribbon for the bow, for a total of **34** feet.
* A present with dimensions **1x1x10** requires **1+1+1+1 = 4** feet of ribbon to wrap the present plus **1×1×10 = 10** feet of ribbon for the bow, for a total of **14** feet.

How many total feet of ribbon should they order?

[See this problem on Advent of Code](http://adventofcode.com/day/2) | [See my part one solution (.rb)](https://github.com/dominikduda/advent_of_code_solutions/blob/master/solutions/day_2_part_one.rb) | [See my part two solution (.rb)](https://github.com/dominikduda/advent_of_code_solutions/blob/master/solutions/day_2_part_two.rb)
