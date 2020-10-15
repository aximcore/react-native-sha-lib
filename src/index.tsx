import { NativeModules } from 'react-native';

type Sha1LibType = {
  sha1(input: string): Promise<string>;
};

const { Sha1Lib } = NativeModules;

export default Sha1Lib as Sha1LibType;
