// Copyright (c) Facebook, Inc. and its affiliates
// SPDX-License-Identifier: MIT OR Apache-2.0
part of lcs_test;

void runLcsTests() {
  test('serializer u32 work', () {
    LcsSerializer serializer = new LcsSerializer();
    serializer.serialize_u32(1);
    expect(serializer.get_bytes(), Uint8List.fromList([1, 0, 0, 0]));
  });

  test('deserializer u32 work', () {
    LcsDeserializer serializer =
        new LcsDeserializer(Uint8List.fromList([1, 0, 0, 0]));
    int result = serializer.deserialize_u32();
    expect(result, 1);
  });

  test('test slice work', () {
    LcsSerializer serializer = new LcsSerializer();
    serializer.serialize_u8(-1);
    serializer.serialize_u32(1);
    serializer.serialize_u32(1);
    serializer.serialize_u32(2);
    expect(
        serializer.get_bytes(),
        Uint8List.fromList([
          -1,
          /**/ 1,
          /**/ 0,
          0,
          /**/ 0,
          1,
          0,
          /**/ 0,
          /**/ 0,
          /**/ 2,
          0,
          0,
          0
        ]));
  });
}