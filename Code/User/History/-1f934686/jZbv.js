import { StyleSheet, View, Text } from "react-native";

function taskItem(props) {
  /* task list view */
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
