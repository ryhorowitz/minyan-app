import { Link } from "react-router-dom"
export default function LoginSignupButtonsContainer() {
  return (
    <>
      <div className="container mt-2">
        <div className="row">
          <div className="col">
            <li className="nav-item"  >
              <Link className="nav-link" to="/login">Login</Link>
            </li>
          </div>
          <div className="col">
            <li className="nav-item">
              <Link className="nav-link" to="/signup">Signup</Link>
            </li>
          </div>
        </div>
      </div>
    </>
  )
}

