import { useContext, useEffect, useState } from "react"
import AppContext from "../AppContext"
import { useNavigate } from "react-router-dom"
import convertDateStringIntoReadableTime from "../helpers"
function ShulDetail() {
  const { shulDetails, setShulDetails, user, setUser } = useContext(AppContext)
  const [errors, setErrors] = useState([])
  const navigate = useNavigate()
  useEffect(() => {
    return () => {
      // Update state just before the component unmounts
      setShulDetails({});
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

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

  // console.log('shulDetails is', shulDetails)
  // const servicesList = shulDetails.next_service.map(service => {
  //   return <li className="list-group-item"
  //     key={service.id} >
  //     <div className="row">
  //       <strong>{service.name}</strong> {service.parsed_time}
  //     </div>
  //     <div className="row text-end">
  //       {service.parsed_date}
  //     </div>
  //     <div className="row text-end">
  //       {service.users.length} people have RSVP'd
  //       {/* I need to update state when I RSVP ????*/}
  //     </div>
  //     <div className="container text-end">
  //       <button type="button"
  //         className="btn btn-primary btn-sm"
  //         id={`service-${service.id}`}
  //         onClick={(e) => handleRSVP(service.id, e)}>RSVP</button>
  //     </div>
  //   </li>
  // })
  const nextService = shulDetails.next_service
  const time = convertDateStringIntoReadableTime(nextService.time)
  return (
    <>
      <div className="container-md my-3">
        <div className="row">
          <div className="col w-50 mx-auto">
            <img src={shulDetails.img}
              className="card-img-top img-fluid"
              alt={shulDetails.name}
            ></img>
          </div>
          <div className="col w-50 mx-auto">
            <div className="card-body">
              <h5 className="card-title text-center">{shulDetails.name}</h5>
              <p className="text-end">{shulDetails.street_address} {shulDetails.city}, {shulDetails.state} {shulDetails.postal_code}</p>
              <h4>Next Service is:</h4>
              <p className="card-text">{nextService.name}</p>
              <p className="card-text">{nextService.date} at {time}</p>
            </div>
            {/*
            <ul className="list-group list-group-flush">
              {servicesList.length > 0 ? servicesList : 'No Services at the moment'}
            </ul>
            {servicesList.length > 0 ?
              <p className="fs-6 mt-2">Click RSVP button to confirm that you are joining tomorrow's minyan.</p> :
              null}
            {errors.length > 0 && (
              <ul style={{ color: "red" }}>
                {errors.map((error) => (
                  <li key={error}> {`RSVP Error: ${error}`} </li>
                ))}
              </ul>
            )} */}
          </div>
        </div>

      </div>
    </>
  )

}

export default ShulDetail