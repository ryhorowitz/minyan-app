import React, { useState, useEffect } from 'react';
import AppContext from './AppContext';

const AppProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [shuls, setShuls] = useState([])
  const [shulDetails, setShulDetails] = useState({})

  useEffect(() => {
    fetch(`/shuls`)
      .then(r => r.json())
      .then(shuls => setShuls(shuls))
  }, [user])

  function handleLogout() {
    fetch('/logout', { method: 'DELETE' })
      .then(() => setUser(null))
      .then(() => setShuls([]))
  }

  return (
    <AppContext.Provider value={{
      user, setUser,
      shuls, setShuls,
      shulDetails, setShulDetails,
      handleLogout
    }}>
      {children}
    </AppContext.Provider>
  );
};

export default AppProvider;