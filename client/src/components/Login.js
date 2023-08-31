import React, { useState, useContext } from "react"
import AppContext from "../AppContext"
import { useNavigate } from "react-router-dom"

function Login() {
  const { setUser } = useContext(AppContext)
  // eslint-disable-next-line
  const [loginErrors, setLoginErrors] = useState([])

  const [loginFormData, setLoginFormData] = useState({
    username: '',
    password: ''
  })

  const navigate = useNavigate()
  function handleLoginFormData(e) {
    const { name, value } = e.target
    setLoginFormData({ ...loginFormData, [name]: value })
  }


  function handleLogin(e) {
    e.preventDefault()
    const body = {
      username: loginFormData.username,
      password: loginFormData.password
    }
    fetch("/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(body)
    })
      .then(r => {
        if (r.ok) {
          r.json().then(user => {
            setUser(user)
            navigate('/home')
          })
        } else {
          r.json().then(e => {
            console.log('error response', e.error)
            setLoginErrors(Object.values(e).flat())
          })
        }
      })
  }



  return (
    <>
      <div className="container">
        <div className="row justify-content-center">
          <div className="col-md-6">
            <h2>Login</h2>
            {loginErrors.length > 0 && (
              <ul style={{ color: "red" }}>
                {loginErrors.map((error) => (
                  <li key={error}>{error}</li>
                ))}
              </ul>
            )}
            <form onSubmit={handleLogin}>
              <div className="form-group">
                <label htmlFor="login-username">Username</label>
                <input
                  type="text"
                  id="login-username"
                  name="username"
                  value={loginFormData.username}
                  onChange={handleLoginFormData}
                  className="form-control"
                  autoComplete="on"
                  required />
              </div>
              <div className="form-group">
                <label htmlFor="login-password">Password:</label>
                <input
                  type="password"
                  id="login-password"
                  className="form-control"
                  name="password"
                  value={loginFormData.password}
                  onChange={handleLoginFormData}
                  required
                />
              </div>
              <button type="submit" className="btn btn-primary mt-1">Login</button>
            </form>
          </div>
        </div>
      </div>


    </>
  )

}
export default Login