export function convertDateTimeStringIntoReadableTime(datetimeString) {
  const date = new Date(datetimeString)

  const formattedDateTime = date.toLocaleDateString("en-US", {
    year: "numeric",
    month: "long",
    day: "numeric",
    hour: "numeric",
    minute: "numeric",
    hour12: true
  })
  return formattedDateTime
}

// NO LONGER BEING USED
// export function convertDateStringIntoReadableDate(dateString) {

//   // Create a Date object from the input string
//   const date = new Date(dateString)

//   // Format the date in a nice readable way
//   const formattedDate = date.toLocaleDateString("en-US", {
//     weekday: "long",
//     year: "numeric",
//     month: "long",
//     day: "numeric",
//   });

//   // console.log(formattedDate); // Output: "September 21, 2023"
//   return formattedDate
// }

// export function convertTimeStringIntoReadableTime(timeString) {
//   // Create a Date object from the input string
//   const time = new Date(timeString)

//   // Extract the hours, minutes, and seconds
//   const hours = time.getUTCHours()
//   const minutes = time.getUTCMinutes()
//   // Determine whether it's AM or PM
//   const amOrPm = hours >= 12 ? "pm" : "am"

//   // Convert hours to 12-hour format
//   const formattedHours = hours % 12 || 12 // Handle midnight (0) as 12
//   // Format the time as "hh:mm AM/PM"
//   const formattedTime = `${formattedHours}:${minutes < 10 ? "0" : ""}${minutes} ${amOrPm}`
//   return formattedTime
// }

