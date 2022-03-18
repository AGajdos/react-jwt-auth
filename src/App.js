import React, { Component } from "react";
import { Switch, Route, Link } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import "./App.css";
import { Nav, Navbar, NavDropdown } from "react-bootstrap";

import AuthService from "./services/auth.service";

import Login from "./components/login.component";
import Register from "./components/register.component";


import BoardUser from "./components/board-user.component";
import BoardModerator from "./components/board-moderator.component";
import BoardAdmin from "./components/board-admin.component";
import Torles from "./sajatosztalyok/Torles";
import Izomcsoporttorles from "./sajatosztalyok/Izomcsoporttorles";
import Mell from "./sajatosztalyok/Mell";
import Forum from "./sajatosztalyok/Forum";
import Adatfelvitel from "./sajatosztalyok/Adatfelvitel";
import Fooldal from "./sajatosztalyok/Fooldal";
import Hat from "./sajatosztalyok/Hat";
import Bicepsz from "./sajatosztalyok/Bicepsz";
import Comb from "./sajatosztalyok/Comb";
import Tricepsz from "./sajatosztalyok/Tricepsz";
import Vadli from "./sajatosztalyok/Vadli";
import Vall from "./sajatosztalyok/Vall";
import Kommenttorles from "./sajatosztalyok/Kommenttorles";
import Kereses from "./sajatosztalyok/Kereses";

class App extends Component {
  constructor(props) {
    super(props);
    this.logOut = this.logOut.bind(this);

    this.state = {
      showModeratorBoard: false,
      showAdminBoard: false,
      currentUser: undefined,
    };
  }

  componentDidMount() {
    const user = AuthService.getCurrentUser();

    if (user) {
      this.setState({
        currentUser: user,
        showModeratorBoard: user.roles.includes("ROLE_MODERATOR"),
        showAdminBoard: user.roles.includes("ROLE_ADMIN"),
      });
    }
  }

  logOut() {
    AuthService.logout();
  }

  render() {
    const { currentUser, showModeratorBoard, showAdminBoard } = this.state;

    return (
      <div>

<Navbar collapseOnSelect expand="lg" bg="dark" variant="dark">
      <Navbar.Brand href="Fooldal">
        
        Főoldal
      </Navbar.Brand>
      <Navbar.Toggle aria-controls="responsive-navbar-nav" />
      <Navbar.Collapse id="responsive-navbar-nav">
        <Nav className="mr-auto">
          

        <NavDropdown title="Gyakorlatok" id="collasible-nav-dropdown">
            <NavDropdown.Item href="Mell">Mell gyakorlatok</NavDropdown.Item>
            <NavDropdown.Item href="Hat">Hát gyakorlatok</NavDropdown.Item>
            <NavDropdown.Item href="Vall">Váll gyakorlatok</NavDropdown.Item>
            <NavDropdown.Item href="Bicepsz">Bicepsz gyakorlatok</NavDropdown.Item>
            <NavDropdown.Item href="Tricepsz">Tricepsz gyakorlatok</NavDropdown.Item>
            <NavDropdown.Item href="Comb">Comb gyakorlatok</NavDropdown.Item>
            <NavDropdown.Item href="Vadli">Vádli gyakorlatok</NavDropdown.Item>
          </NavDropdown>
          
          <Nav.Link href="Forum">Fórum</Nav.Link>
          <Nav.Link href="Kereses">Keresés</Nav.Link>
          
          
          {showAdminBoard && (
          <NavDropdown title="Admin" id="collasible-nav-dropdown">
            <NavDropdown.Item href="Torles">Gyakorlat törlése</NavDropdown.Item>
            <NavDropdown.Item href="Izomcsoporttorles">Itomcsoport törlése</NavDropdown.Item>
            <NavDropdown.Item href="Adatfelvitel">Adatfelvitel</NavDropdown.Item>
            <NavDropdown.Item href="Kommenttorles">Kommenttörlés</NavDropdown.Item>
          </NavDropdown>
          )}
        </Nav>
        <Nav>
        {currentUser ? (
          <Nav className="mr-auto">
          <Nav.Link href="">
            {currentUser.username}
            </Nav.Link>
            <Nav.Link href="/login" onClick={this.logOut}>
            Kijeletkezés
            </Nav.Link>
            </Nav>
          ) : (
            
            <Nav className="mr-auto">
            <Nav.Link href="/login">
            Bejelenkezés
              </Nav.Link>
              <Nav.Link href="/register">
              Regisztráció
              </Nav.Link>
              </Nav>
          )}
        </Nav>
      </Navbar.Collapse>
    </Navbar>


        <div className="container mt-3">
          <Switch>
            <Route exact path={["/", "/Fooldal"]} component={Fooldal} />
            <Route exact path="/login" component={Login} />
            <Route exact path="/register" component={Register} />
           
            <Route path="/user" component={BoardUser} />
            <Route path="/mod" component={BoardModerator} />
            <Route path="/admin" component={BoardAdmin} />
            <Route path="/Torles" component={Torles} />
            <Route path="/Izomcsoporttorles" component={Izomcsoporttorles} />
            <Route path="/Mell" component={Mell} />
            <Route path="/Forum" component={Forum} />
            <Route path="/Adatfelvitel" component={Adatfelvitel} />
            <Route path="/Fooldal" component={Fooldal} />
            <Route path="/Hat" component={Hat} />
            <Route path="/Bicepsz" component={Bicepsz} />
            <Route path="/Comb" component={Comb} />
            <Route path="/Tricepsz" component={Tricepsz} />
            <Route path="/Vadli" component={Vadli} />
            <Route path="/Vall" component={Vall} />
            <Route path="/Kommenttorles" component={Kommenttorles} />
            <Route path="/Kereses" component={Kereses} />
          </Switch>
        </div>
      </div>
    );
  }
}

export default App;
