///
//  Generated code. Do not modify.
//  source: reviews.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'reviews.pb.dart' as $0;
export 'reviews.pb.dart';

class ReviewServiceClient extends $grpc.Client {
  static final _$createReview =
      $grpc.ClientMethod<$0.CreateReviewRequest, $0.CreateReviewResponse>(
          '/reviews.interface.ReviewService/createReview',
          ($0.CreateReviewRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateReviewResponse.fromBuffer(value));

  ReviewServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateReviewResponse> createReview(
      $0.CreateReviewRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createReview, request, options: options);
  }
}

abstract class ReviewServiceBase extends $grpc.Service {
  $core.String get $name => 'reviews.interface.ReviewService';

  ReviewServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.CreateReviewRequest, $0.CreateReviewResponse>(
            'createReview',
            createReview_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateReviewRequest.fromBuffer(value),
            ($0.CreateReviewResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateReviewResponse> createReview_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CreateReviewRequest> request) async {
    return createReview(call, await request);
  }

  $async.Future<$0.CreateReviewResponse> createReview(
      $grpc.ServiceCall call, $0.CreateReviewRequest request);
}
