import { Link } from "react-router-dom"
import { useContext } from "react"
import AppContext from "../AppContext"
export default function NavBar({ logout }) {
  const { user } = useContext(AppContext)
  return (
    <>

      <nav className="navbar justify-content-center navbar-expand-lg navbar-light"
        style={{ background: '#e3f2fd' }}>
        <ul className="navbar-nav ml-auto">

          <div className="container mt-2">
            <div className="row">
              <div className="col-2">
                <li className="nav-item"  >
                  <Link className="nav-link" to={"/about"}>About</Link>
                </li>
              </div>
              <div className="col-2">
                <li className="nav-item"  >
                  <Link className="nav-link" to={"/users/" + user.username}>Profile</Link>
                </li>
              </div>
              <div className="col-2">
                <li className="nav-item"  >
                  <Link className="nav-link" to="/shuls">Shuls</Link>
                </li>
              </div>
              <div className="col-4">
                <li className="nav-item"  >
                  <Link className="nav-link" to={"/contact-shul"}>Contact Shul</Link>
                </li>
              </div>
              <div className="col-2">
                <li className="nav-item">
                  <Link className="nav-link" to="/login" onClick={logout}>Logout</Link>
                </li>
              </div>
            </div>
          </div>
        </ul>
      </nav>
    </>
  )
}

