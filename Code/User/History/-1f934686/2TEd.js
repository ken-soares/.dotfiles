import { StyleSheet } from "react-native";

function taskItem(props) {
  return (
    <View style={styles.listItem}>
      <Text style={{ textAlign: "center", color: "#eee" }}>{props.text}</Text>
    </View>
  );
}

export default taskItem;

const styles = StyleSheet.create({
  listItem: {
    margin: 8,
    padding: 8,
    fontSize: 15,
    borderRadius: 6,
    backgroundColor: "#5e0acc",
  },
});
