import { useContext, useState } from "react"
import { useNavigate } from "react-router-dom"
import AppContext from "../AppContext"
import ContactSuccessModal from "./ContactSuccessModal"
function ContactShul() {
  const { shuls } = useContext(AppContext)
  const [recipient, setRecipient] = useState(shuls[0].name)
  const [message, setMessage] = useState('')
  const [errors, setErrors] = useState([])
  const [showModal, setShowModal] = useState(false)
  const navigate = useNavigate()
  const shulSelectOptions = shuls.map(shul => {
    return <option value={shul.name} key={shul.id}>{shul.name}</option>
  })

  function toggleModal() {
    setShowModal(!showModal)
    console.log('toggleModal')
    modalTimer()
  }

  function modalTimer() {
    setTimeout(() => {
      setShowModal(!showModal)
      navigate('/profile')
    }, 3000)
  }
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
      .then(r => {

        if (r.ok) {
          r.json().then(user => {
            console.log('r', r)
            toggleModal()
          })
        } else {
          r.json().then(e => {
            console.error('err res', e.error)
            setErrors(Object.values(e).flat())
          })
        }
      })
  }

  return (
    <div className="container">

      {/* message */}
      {/* send button that fires off an email*/}
      <div className="container mt-5">
        <div className="row">
          <div className="col-md-6 offset-md-3">
            {errors.length > 0 && (
              <ul style={{ color: "red" }}>
                {errors.map((error) => (
                  <li key={error}>{error}</li>
                ))}
              </ul>
            )}
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
                  required
                ></textarea>
              </div>
              <button type="submit" className="btn btn-primary">Submit</button>
            </form>
          </div>
        </div>
        <div className={`modal ${showModal ? 'show' : ''}`} tabIndex="-1" style={{ display: showModal ? 'block' : 'none' }}>
          <ContactSuccessModal toggleModal={toggleModal} />
        </div>

      </div >
    </div >
  )
}

export default ContactShul