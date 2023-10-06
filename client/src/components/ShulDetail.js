import { useContext, useState } from "react"
import AppContext from "../AppContext"
import { useNavigate, useParams } from "react-router-dom"
import { convertDateTimeStringIntoReadableTime } from "../helpers"


function ShulDetail() {
  const { user, setUser, shuls } = useContext(AppContext)
  const [errors, setErrors] = useState([])

  const navigate = useNavigate()
  const { id } = useParams()

  const shul = shuls.find(shul => shul.id === Number(id))
  const nextService = shul.services[shul.services.length - 1]

  if (!nextService) {
    return (
      <div className="container-md my-3">
        <div className="row">
          <div className="col w-50 mx-auto">
            <img src={shul.img}
              className="card-img-top img-fluid"
              alt={shul.name}
            ></img>
          </div>
          <div className="col w-50 mx-auto">
            <div className="card-body">
              <h5 className="card-title text-center">{shul.name}</h5>
              <p className="text-center">{shul.street_address} {shul.city}, {shul.state} {shul.postal_code}</p>
              <h5>No Services at the moment</h5>
            </div>
          </div>
        </div>
      </div>
    )
  }
  const datetime = convertDateTimeStringIntoReadableTime(nextService.datetime)

  // console.log('next service datetime', datetime)
  function addRSVPToState(rsvp) {
    setUser({
      ...user,
      user_services: [...user.user_services, rsvp]
    })
  }
  async function handleRSVP(serviceId, e) {
    const postObj = {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        user_id: user.id,
        service_id: serviceId
      })
    }

    const res = await fetch(`/user_service/`, postObj)
    const rsvp = await res.json()
    if (res.ok) {
      addRSVPToState(rsvp)
      navigate(`/users/${user.id}`)
    } else {
      console.log('res errors', rsvp.errors)
      setErrors(rsvp.errors)
    }
  }
  return (
    <>
      <div className="container-md my-3">
        <div className="row">
          <div className="col w-50 mx-auto">
            <img src={shul.img}
              className="card-img-top img-fluid"
              alt={shul.name}
            ></img>
          </div>
          <div className="col w-50 mx-auto">
            <div className="card-body">
              <h5 className="card-title text-center">{shul.name}</h5>
              <p className="text-center">{shul.street_address} {shul.city}, {shul.state} {shul.postal_code}</p>
              <>
                <h4>Next Service is:</h4>
                <p className="card-text mb-n1">{nextService.name}</p>
                <p className="card-text mb-n1">{datetime}</p>
                <div className="container pr-1 mr-2 text-end">
                  {nextService.users.length} people have RSVP'd
                </div>
                <div className="container m-1">
                  <button type="button"
                    className="btn btn-primary btn-sm"
                    id={`service-${nextService.id}`}
                    onClick={(e) => handleRSVP(nextService.id, e)}>RSVP</button>
                </div>
                <>
                  {errors.length > 0 && (
                    <ul style={{ color: "red" }}>
                      {errors.map((error) => (
                        <li key={error}> {`RSVP Error: ${error}`} </li>
                      ))}
                    </ul>
                  )}
                </>
              </>
            </div>
          </div>
        </div>
      </div>
    </>
  )
}

export default ShulDetail