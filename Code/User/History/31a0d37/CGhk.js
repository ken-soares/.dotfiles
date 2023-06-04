import { View, StyleSheet, TextInput } from "react-native";
function TaskInput(props) {
  return (
    /* task input component */
    <View style={styles.inputContainer}>
      <TextInput
        style={styles.textInput}
        placeholder="Your task"
        onChangeText={props.taskInputHandler}
      />

      <Button title="add task" onPress={props.addTaskHandler} />
    </View>
  );
}

const styles = StyleSheet.create({
  inputContainer: {
    flex: 1,
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    MarginBottom: 24,
    borderBottomWidth: 1,
    BorderBottomColor: "#cccccc",
  },

  textInput: {
    borderWidth: 1,
    borderColor: "#cccccc",
    width: "70%",
    marginRight: 8,
    padding: 8,
  },
});

export default TaskInput;
