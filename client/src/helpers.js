function convertDateStringIntoReadableTime(dateString) {

  // Create a Date object from the input string
  const date = new Date(dateString);

  // Format the date in a nice readable way
  const formattedDate = date.toLocaleDateString("en-US", {
    weekday: "long",
    year: "numeric",
    month: "long",
    day: "numeric",
  });

  // console.log(formattedDate); // Output: "September 21, 2023"
  return formattedDate
}


export default convertDateStringIntoReadableTime 
