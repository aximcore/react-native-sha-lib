import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import Sha1Lib from 'react-native-sha1-lib';

export default function App() {
  const [result, setResult] = React.useState<string | undefined>();

  React.useEffect(() => {
    // Sha1Lib.multiply(3, 7).then(setResult);
    Sha1Lib.sha1('test').then(setResult);
  }, []);

  return (
    <View style={styles.container}>
      <Text selectable={true}>SHA1: {result}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
