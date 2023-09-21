
function convertDateStringIntoReadableTime(dateStr) {

  // Parse the input time string into a Date object
  const date = new Date(dateStr);

  // Convert to local time zone
  const localDate = new Date(date.toLocaleString());
  console.log('localDate', localDate)
  // Get the hours and minutes from the Date object
  const hours = localDate.getHours();
  const minutes = localDate.getMinutes();
  console.log('hours', hours)
  // Determine whether it's AM or PM
  const amOrPm = hours >= 12 ? "PM" : "AM";

  // Convert hours from 24-hour format to 12-hour format
  const formattedHours = hours % 12 || 12;

  // Create the formatted time string
  return `${formattedHours}:${minutes.toString().padStart(2, '0')} ${amOrPm}`;
}

export default convertDateStringIntoReadableTime 
