var Route = ReactRouter.Route,
    DefaultRoute = ReactRouter.DefaultRoute;                                                                                                                          

this.MyRoutes = (
    <Route>
    <DefaultRoute handler={home} />
    <Route handler={ReservationForm} path='reservation_form' />
    <Route handler={MainReservation} path='reservations' />
    <Route handler={ApprovedMainReservation} path='a_reservations'/>
    </Route>
);
