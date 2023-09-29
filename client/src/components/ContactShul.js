import { useContext, useState } from "react"
import AppContext from "../AppContext"
function ContactShul() {
  const { user, shuls } = useContext(AppContext)
  const [recipient, setRecipient] = useState(shuls[0].name)
  const [message, setMessage] = useState('')
  const [errors, setErrors] = useState([])
  // {/* select option listing all shuls */}

  const shulSelectOptions = shuls.map(shul => {
    return <option value={shul.name} key={shul.id}>{shul.name}</option>
  })

  function handleSelectShul(e) {
    setRecipient(e.target.value)
  }
  function handleMessageChange(e) {
    setMessage(e.target.value)
  }

  function submitMessage(e) {
    // trigger action mailer
    e.preventDefault()
    console.log('submitMessage clicked')
    fetch("/contact-shul", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ recipient, message })
    })
      .then(r => r.json())
      .then(r => console.log(r))
      .catch(e => console.error('err is', e))
  }

  return (
    <div className="container">

      {/* message */}
      {/* send button that fires off an email*/}
      <div className="container mt-5">
        <div className="row">
          <div className="col-md-6 offset-md-3">
            <form onSubmit={submitMessage}>
              <div className="mb-3">
                <label htmlFor="selectOption" className="form-label">Contact:</label>
                <select className="form-select"
                  id="selectOption"
                  name="shul-option"
                  onChange={handleSelectShul}
                >
                  {shulSelectOptions}
                </select>
              </div>
              <div className="mb-3">
                <label htmlFor="textarea" className="form-label" >Message:</label>
                <textarea className="form-control"
                  id="textarea"
                  rows="4"
                  name="message"
                  onChange={handleMessageChange}
                ></textarea>
              </div>
              <button type="submit" className="btn btn-primary">Submit</button>
            </form>
          </div>
        </div>
      </div >
    </div >
  )
}

export default ContactShul