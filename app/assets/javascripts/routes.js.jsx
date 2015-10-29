var Route = ReactRouter.Route,
    DefaultRoute = ReactRouter.DefaultRoute;                                                                                                                          

this.MyRoutes = (
    <Route>
    <DefaultRoute handler={home} />
    <Route handler={Reservations} path='reservations'/>
    </Route>
);
