import { Image, TouchableOpacity } from "react-native";

import styles from "./screenheader.style";

const ScreenHeaderBtn = ({iconUrl, dimension, handlePress }) => {
  return (
    <TouchableOpacity>
      <Image
      source={iconUrl}
      resizeMode="cover"
      />
    </TouchableOpacity>
  )
}
export default ScreenHeaderBtn;
