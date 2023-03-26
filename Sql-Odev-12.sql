--film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
select count(*) from film where length>(select avg(length) from film);

--film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
select count(*) from film where rental_rate=(select max(rental_rate) from film);

--film tablosunda en düşük rental_rate ve en düşük replacement_cost değerlerine sahip filmleri sıralayınız.
select * from film where film_id = ANY (
select film_id from film where rental_rate=(select min(rental_rate) from film) and replacement_cost=(select min(replacement_cost) from film)
) ;

--payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
select payment.customer_id,count(payment.customer_id) "Alışveriş_Sayısı",customer.first_name,customer.last_name from payment left join customer on customer.customer_id=payment.customer_id
group by payment.customer_id,customer.first_name,customer.last_name order by count(payment.customer_id) desc 





