# Function to convert card value to numeric
convert_to_numeric <- function(card) {
  card_value <- substr(card, 1, 1)
  return(match(card_value, card_values))
}
