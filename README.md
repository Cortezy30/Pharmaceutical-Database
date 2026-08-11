Introduction:
This was a Database and Design semester project that was intended to simulate a business in need of help to update and create a more modern approach to solving business needs and questions that could be answered using relational databases and manipulating the data with queries using PostgreSQL as the main framework.

The context: 
In my selected example I was tasked by a pharmaceutical company using a very outdated system from the 70s to update their records 
and modernize it using a relational database. The information that was provided that the database needed to keep track of was the following 

"Each drug is manufactured at a manufacturing site and then quality tested at a quality control site before being sent to a packaging site to be shipped to a wholesaler. Drugs are shipped to multiple countries, and therefore the same drugs may have multiple manufacturing sites depending on the location for which they are destined. The price of each drug varies depending on the country where it is shipped. In addition to the locations of the drugs during the manufacturing process, we also need to keep track of the associated products that are used to manufacture the drugs, the suppliers of these products, and the unit cost of these products."

"Some of our drugs are manufactured in different dosage forms and strengths and may have different manufacturing sites. Additionally, some of our drugs are branded and still protected under patent law while others are generics. The branded drugs should have a specific date that the patent is set to expire. At this time, other companies can begin to sell generic forms of this drug, so our expected profit for this drug will drop significantly."

Initial a daunting task with how many processes were in front of me I had the help of my professor and my classmates to give me ideas on how exactly to extract what was necessary the following questions 

The questions that the business actually cares to answer:
1. Determine the net profit of each drug
2. Which of their products sell the highest quantities
3. The breakdown of sales per country
4. Which of their products could benefit from a greater marketing effort and in which locations.

Keeping these in mind I made the decision to cut out a lot of the detailed manufacturing processes because they held no real value into determining the questions that were of main interest. However, I did understand that a lot of these manufacturing details could be normalized I ran into a cycle of over-normalizing that lead me to the final over all design of the following relationships

The relationships:
Drug → DrugFormulation: One-to-many.
DrugFormulation → Sales: One-to-many.
DrugFormulation → Costs: One-to-many.
Countries → Sales: One-to-many.
Countries → Costs: One-to-many.

I put it down this way because a Drug can have many formulations(i.e. pills, inhaler, etc) and drug formualtions can have many sales and many costs because the price varies per country. Countries have many sales and many costs because there are various drugs sold and different many costs in each one of those countries

One might say a lot of these are many to many, but I felt as if in order to avoid constantly making adjustments and normalizations the focus was to answer the questions than to make this the most normalized database. I deemed it an unnecessary task as no money was at stake in this event but I kept it in mind.

The following are my constraints that helped in the table design process:
1.Primary and foreign keys enforce entity relationships.
2.Drug formulations must be unique by DrugID, DosageForm, and Strength.
3.Cost records must be unique by formulation and country.
4.Quantities sold must be greater than zero.
5.Sale prices and manufacturing/shipping costs cannot be negative.
6.Required fields use NOT NULL constraints.

bullets 2 and 3 were most important as to help prevent duplication and redundancy that could mess up the queries.

Finally the tables:
Drug — Stores drug identification, brand status, and patent expiration.
DrugFormulation — Stores the dosage form and strength of each drug.
Countries — Stores countries where drugs are sold.
Sales — Stores quantities sold, sale prices, dates, and destination countries.
Costs — Stores manufacturing and shipping costs for each formulation by country.

Conclusion:
This was definitely a hard task at the time as I had multiple projects going from my OOP class and Computer Architecture class on top of this Database and Design course, but it did open a window of curiosity about how databases are manipulated and designed to best suit the needs of businesses and how in depth it gets to really create what works best. I hope to find more opportunities in the future to implement these structures for work.
