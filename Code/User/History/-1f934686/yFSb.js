function taskItem() {
  return (
    <View style={styles.listItem}>
      <Text style={{ textAlign: "center", color: "#eee" }}>
        {itemData.item.text}
      </Text>
    </View>
  );
}

export default taskItem;
