Work with a partner. Go at the same pace as your partner, working through each step together.

1. Load in the hamsters data set like we did last time

2. Create a new data frame titled "hamsters_many" that includes only people who have at least 5 hamsters.

3. Create a new data frame titled "hamsters_many_cages" that includes only people who have at least 3 hamster cages.

4. Run the following code:

> many = bind_rows(hamsters_many, hamsters_many_cages)

5. What did that code do? 

6. Run the code following code:

> arrange(many, hamsters, hamsers_cages)

7. What did that code do?

8. Run the following code to save your results:

> write_rds(many, "data-clean/many.rds")

9. Did you get an error? How can you fix it?

10. Run the following code to save your workspace

> save.image()

11. If you were going to leave Rstudio and then come back in, what would you do to continue working?
