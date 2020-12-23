--количество рейсов каждого из видов самолетов
SELECT DISTINCT plane.model, count(flight.aircraft_code) OVER (PARTITION BY flight.aircraft_code)
FROM bookings.flights flight
JOIN bookings.aircrafts plane ON plane.aircraft_code = flight.aircraft_code

--в какие аэропорты в какие дни летали чаще всего
SELECT scheduled_arrival::date, arrival_airport, count(arrival_airport)
FROM bookings.flights 
GROUP BY scheduled_arrival::date, arrival_airport
ORDER BY count(arrival_airport) DESC

--сколько бизнес мест и эконом мест было занято на каждом рейсе
SELECT 
	fl.flight_id, 
	count(CASE WHEN fare_conditions = 'Business' THEN 1 ELSE NULL END) as b_count, 
	count(CASE WHEN fare_conditions = 'Economy' THEN 1 ELSE NULL END) as e_count
FROM bookings.flights fl JOIN bookings.ticket_flights tfl ON fl.flight_id = tfl.flight_id
GROUP BY fl.flight_id

--сколько денег по убыванию потратил каждый из пассажиров, у котого было не более 5 перелетов 
SELECT tik.passenger_name, count(tik.passenger_name) AS cnt, sum(book.total_amount)
FROM tickets tik JOIN bookings book ON tik.book_ref = book.book_ref
GROUP BY tik.passenger_name HAVING count(tik.passenger_name) <= 5
ORDER BY sum(book.total_amount) DESC
LIMIT 20


