///
//  Generated code. Do not modify.
//  source: reviews.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use reviewDescriptor instead')
const Review$json = const {
  '1': 'Review',
  '2': const [
    const {'1': 'nameBuyer', '3': 1, '4': 1, '5': 9, '10': 'nameBuyer'},
    const {'1': 'nameProduct', '3': 2, '4': 1, '5': 9, '10': 'nameProduct'},
    const {'1': 'commentary', '3': 3, '4': 1, '5': 9, '10': 'commentary'},
    const {'1': 'puntuation', '3': 4, '4': 1, '5': 5, '10': 'puntuation'},
  ],
};

/// Descriptor for `Review`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reviewDescriptor = $convert.base64Decode('CgZSZXZpZXcSHAoJbmFtZUJ1eWVyGAEgASgJUgluYW1lQnV5ZXISIAoLbmFtZVByb2R1Y3QYAiABKAlSC25hbWVQcm9kdWN0Eh4KCmNvbW1lbnRhcnkYAyABKAlSCmNvbW1lbnRhcnkSHgoKcHVudHVhdGlvbhgEIAEoBVIKcHVudHVhdGlvbg==');
@$core.Deprecated('Use createReviewRequestDescriptor instead')
const CreateReviewRequest$json = const {
  '1': 'CreateReviewRequest',
  '2': const [
    const {'1': 'review', '3': 1, '4': 1, '5': 11, '6': '.reviews.interface.Review', '10': 'review'},
  ],
};

/// Descriptor for `CreateReviewRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReviewRequestDescriptor = $convert.base64Decode('ChNDcmVhdGVSZXZpZXdSZXF1ZXN0EjEKBnJldmlldxgBIAEoCzIZLnJldmlld3MuaW50ZXJmYWNlLlJldmlld1IGcmV2aWV3');
@$core.Deprecated('Use createReviewResponseDescriptor instead')
const CreateReviewResponse$json = const {
  '1': 'CreateReviewResponse',
  '2': const [
    const {'1': 'messageOfConfirmation', '3': 1, '4': 1, '5': 9, '10': 'messageOfConfirmation'},
  ],
};

/// Descriptor for `CreateReviewResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReviewResponseDescriptor = $convert.base64Decode('ChRDcmVhdGVSZXZpZXdSZXNwb25zZRI0ChVtZXNzYWdlT2ZDb25maXJtYXRpb24YASABKAlSFW1lc3NhZ2VPZkNvbmZpcm1hdGlvbg==');
