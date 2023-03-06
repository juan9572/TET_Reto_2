///
//  Generated code. Do not modify.
//  source: reviews.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Review extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Review', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'reviews.interface'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameBuyer', protoName: 'nameBuyer')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameProduct', protoName: 'nameProduct')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commentary')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'puntuation', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Review._() : super();
  factory Review({
    $core.String? nameBuyer,
    $core.String? nameProduct,
    $core.String? commentary,
    $core.int? puntuation,
  }) {
    final _result = create();
    if (nameBuyer != null) {
      _result.nameBuyer = nameBuyer;
    }
    if (nameProduct != null) {
      _result.nameProduct = nameProduct;
    }
    if (commentary != null) {
      _result.commentary = commentary;
    }
    if (puntuation != null) {
      _result.puntuation = puntuation;
    }
    return _result;
  }
  factory Review.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Review.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Review clone() => Review()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Review copyWith(void Function(Review) updates) => super.copyWith((message) => updates(message as Review)) as Review; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Review create() => Review._();
  Review createEmptyInstance() => create();
  static $pb.PbList<Review> createRepeated() => $pb.PbList<Review>();
  @$core.pragma('dart2js:noInline')
  static Review getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Review>(create);
  static Review? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nameBuyer => $_getSZ(0);
  @$pb.TagNumber(1)
  set nameBuyer($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNameBuyer() => $_has(0);
  @$pb.TagNumber(1)
  void clearNameBuyer() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nameProduct => $_getSZ(1);
  @$pb.TagNumber(2)
  set nameProduct($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNameProduct() => $_has(1);
  @$pb.TagNumber(2)
  void clearNameProduct() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get commentary => $_getSZ(2);
  @$pb.TagNumber(3)
  set commentary($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCommentary() => $_has(2);
  @$pb.TagNumber(3)
  void clearCommentary() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get puntuation => $_getIZ(3);
  @$pb.TagNumber(4)
  set puntuation($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPuntuation() => $_has(3);
  @$pb.TagNumber(4)
  void clearPuntuation() => clearField(4);
}

class CreateReviewRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateReviewRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'reviews.interface'), createEmptyInstance: create)
    ..aOM<Review>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'review', subBuilder: Review.create)
    ..hasRequiredFields = false
  ;

  CreateReviewRequest._() : super();
  factory CreateReviewRequest({
    Review? review,
  }) {
    final _result = create();
    if (review != null) {
      _result.review = review;
    }
    return _result;
  }
  factory CreateReviewRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateReviewRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateReviewRequest clone() => CreateReviewRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateReviewRequest copyWith(void Function(CreateReviewRequest) updates) => super.copyWith((message) => updates(message as CreateReviewRequest)) as CreateReviewRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateReviewRequest create() => CreateReviewRequest._();
  CreateReviewRequest createEmptyInstance() => create();
  static $pb.PbList<CreateReviewRequest> createRepeated() => $pb.PbList<CreateReviewRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateReviewRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateReviewRequest>(create);
  static CreateReviewRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Review get review => $_getN(0);
  @$pb.TagNumber(1)
  set review(Review v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasReview() => $_has(0);
  @$pb.TagNumber(1)
  void clearReview() => clearField(1);
  @$pb.TagNumber(1)
  Review ensureReview() => $_ensure(0);
}

class CreateReviewResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateReviewResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'reviews.interface'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageOfConfirmation', protoName: 'messageOfConfirmation')
    ..hasRequiredFields = false
  ;

  CreateReviewResponse._() : super();
  factory CreateReviewResponse({
    $core.String? messageOfConfirmation,
  }) {
    final _result = create();
    if (messageOfConfirmation != null) {
      _result.messageOfConfirmation = messageOfConfirmation;
    }
    return _result;
  }
  factory CreateReviewResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateReviewResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateReviewResponse clone() => CreateReviewResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateReviewResponse copyWith(void Function(CreateReviewResponse) updates) => super.copyWith((message) => updates(message as CreateReviewResponse)) as CreateReviewResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateReviewResponse create() => CreateReviewResponse._();
  CreateReviewResponse createEmptyInstance() => create();
  static $pb.PbList<CreateReviewResponse> createRepeated() => $pb.PbList<CreateReviewResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateReviewResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateReviewResponse>(create);
  static CreateReviewResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageOfConfirmation => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageOfConfirmation($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageOfConfirmation() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageOfConfirmation() => clearField(1);
}

