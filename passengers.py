import os

from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

engine = create_engine(os.getenv("DATABASE_URL"))
db = scoped_session(sessionmaker(bind = engine))

def main():
    flights = db.execute("SELECT id, origin, destination, duration FROM flights")
    for flight in flights:
        print(f"FLIGHT-{flight.id} : {flight.origin} to {flight.destination} , in {flight.duration} minutes .")

    flight_id = int(input('Enter an flight ID: '))
    flight = db.execute("SELECT origin, destination, duration FROM flights WHERE id = :id",{"id":flight_id}).fetchone()

    if flight is None:
        print("\nError: No Such Flight ID")
        return

    passengers = db.execute("SELECT name FROM passengers WHERE flight_id = :flight_id",{"flight_id":flight_id}).fetchall()
    print("\nPassengers:")
    for pas in passengers:
        print(pas.name)
    if len(passengers) == 0:
        return "NO Passengers."
            

if __name__ == '__main__':
    main()
