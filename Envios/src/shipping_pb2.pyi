from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class CreateOrderRequest(_message.Message):
    __slots__ = ["order"]
    ORDER_FIELD_NUMBER: _ClassVar[int]
    order: Order
    def __init__(self, order: _Optional[_Union[Order, _Mapping]] = ...) -> None: ...

class CreateOrderResponse(_message.Message):
    __slots__ = ["messageOfConfirmation"]
    MESSAGEOFCONFIRMATION_FIELD_NUMBER: _ClassVar[int]
    messageOfConfirmation: str
    def __init__(self, messageOfConfirmation: _Optional[str] = ...) -> None: ...

class GetOrderRequest(_message.Message):
    __slots__ = ["name"]
    NAME_FIELD_NUMBER: _ClassVar[int]
    name: str
    def __init__(self, name: _Optional[str] = ...) -> None: ...

class GetOrderResponse(_message.Message):
    __slots__ = ["order"]
    ORDER_FIELD_NUMBER: _ClassVar[int]
    order: Order
    def __init__(self, order: _Optional[_Union[Order, _Mapping]] = ...) -> None: ...

class Order(_message.Message):
    __slots__ = ["address", "buyer", "cityDelivery", "name", "phoneBuyer", "price", "statusPurchase"]
    ADDRESS_FIELD_NUMBER: _ClassVar[int]
    BUYER_FIELD_NUMBER: _ClassVar[int]
    CITYDELIVERY_FIELD_NUMBER: _ClassVar[int]
    NAME_FIELD_NUMBER: _ClassVar[int]
    PHONEBUYER_FIELD_NUMBER: _ClassVar[int]
    PRICE_FIELD_NUMBER: _ClassVar[int]
    STATUSPURCHASE_FIELD_NUMBER: _ClassVar[int]
    address: str
    buyer: str
    cityDelivery: str
    name: str
    phoneBuyer: str
    price: float
    statusPurchase: str
    def __init__(self, statusPurchase: _Optional[str] = ..., buyer: _Optional[str] = ..., name: _Optional[str] = ..., price: _Optional[float] = ..., address: _Optional[str] = ..., phoneBuyer: _Optional[str] = ..., cityDelivery: _Optional[str] = ...) -> None: ...

class UpdateOrderRequest(_message.Message):
    __slots__ = ["name", "order"]
    NAME_FIELD_NUMBER: _ClassVar[int]
    ORDER_FIELD_NUMBER: _ClassVar[int]
    name: str
    order: Order
    def __init__(self, name: _Optional[str] = ..., order: _Optional[_Union[Order, _Mapping]] = ...) -> None: ...

class UpdateOrderResponse(_message.Message):
    __slots__ = ["messageOfConfirmation"]
    MESSAGEOFCONFIRMATION_FIELD_NUMBER: _ClassVar[int]
    messageOfConfirmation: str
    def __init__(self, messageOfConfirmation: _Optional[str] = ...) -> None: ...
