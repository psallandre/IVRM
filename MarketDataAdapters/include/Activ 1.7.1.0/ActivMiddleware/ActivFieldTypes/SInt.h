/**
 *	@file	SInt.h
 *
 *	@brief	Header file for the signed integer class.
 *
 *	$Log: $
 */

#if !defined (ACTIV_SINT_H)
#define ACTIV_SINT_H

#include "ActivMiddleware/ActivFieldTypes/External.h"
#include "ActivMiddleware/ActivFieldTypes/IFieldType.h"

#include "ActivMiddleware/ActivBase/StatusCodeException.h"
#include "ActivMiddleware/Misc/MemoryHelper.h"

namespace Activ
{

class MessageBuilder;
class MessageValidator;

class Rational;

/**
 *	@brief	Signed integer class.
 */
class SInt : public IFieldType
{
public:
	static const FieldType FIELD_TYPE = FIELD_TYPE_SINT; ///< The field type.

	using IFieldType::FromString;
	using IFieldType::Serialize;
	using IFieldType::SerializeBody;
	using IFieldType::SerializeLengthAndBody;
	using IFieldType::Deserialize;
	using IFieldType::DeserializeBody;
	using IFieldType::DeserializeLengthAndBody;

	/**
	 *	@brief	Default constructor.
	 */
	SInt();

	/**
	 *	@brief	Constructor.
	 *
	 *	@param	value the value.
	 */
	SInt(const int64_t value);

	/**
	 *	@brief	Destructor.
	 */
	~SInt();

	/**
	 *	@brief	Equality operator.
	 *
	 *	@param	rhs the object to compare with.
	 *
	 *	@return	the result of the test.
	 *
	 *	@throw	StatusCodeException
	 */
	bool operator==(const SInt &rhs) const;

	/**
	 *	@brief	Inequality operator.
	 *
	 *	@param	rhs the object to compare with.
	 *
	 *	@return	the result of the test.
	 *
	 *	@throw	StatusCodeException
	 */
	bool operator!=(const SInt &rhs) const;

	/**
	 *	@brief	Less than operator.
	 *
	 *	@param	rhs the object to compare with.
	 *
	 *	@return	the result of the test.
	 *
	 *	@throw	StatusCodeException
	 */
	bool operator<(const SInt &rhs) const;

	/**
	 *	@brief	Less than or equal to operator.
	 *
	 *	@param	rhs the object to compare with.
	 *
	 *	@return	the result of the test.
	 *
	 *	@throw	StatusCodeException
	 */
	bool operator<=(const SInt &rhs) const;

	/**
	 *	@brief	Greater than operator.
	 *
	 *	@param	rhs the object to compare with.
	 *
	 *	@return	the result of the test.
	 *
	 *	@throw	StatusCodeException
	 */
	bool operator>(const SInt &rhs) const;

	/**
	 *	@brief	Greater than or equal to operator.
	 *
	 *	@param	rhs the object to compare with.
	 *
	 *	@return	the result of the test.
	 *
	 *	@throw	StatusCodeException
	 */
	bool operator>=(const SInt &rhs) const;

	/**
	 *	@brief	Addition assignment operator.
	 *
	 *	@param	rhs the value to add to this object.
	 *
	 *	@return	a reference to this object.
	 *
	 *	@throw	StatusCodeException
	 */
	SInt& operator+=(const SInt &rhs);

	/**
	 *	@brief	Subtraction assignment operator.
	 *
	 *	@param	rhs the value to subtract from this object.
	 *
	 *	@return	a reference to this object.
	 *
	 *	@throw	StatusCodeException
	 */
	SInt& operator-=(const SInt &rhs);

	/**
	 *	@brief	Multiplication assignment operator.
	 *
	 *	@param	rhs the value to multiply this object by.
	 *
	 *	@return	a reference to this object.
	 *
	 *	@throw	StatusCodeException
	 */
	SInt& operator*=(const SInt &rhs);

	/**
	 *	@brief	Division assignment operator.
	 *
	 *	@param	rhs the value to divide this object by.
	 *
	 *	@return	a reference to this object.
	 *
	 *	@throw	StatusCodeException
	 */
	SInt& operator/=(const SInt &rhs);

	/**
	 *	@brief	Rational conversion operator.
	 */
	ACTIV_FIELD_TYPES_API operator const Rational() const;

	/**
	 *	@brief	Set a new value.
	 *
	 *	@param	value the value.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 */
	StatusCode Set(const int64_t value);

	/**
	 *	@brief	Get the value.
	 *
	 *	@param	value the value.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_NOT_INITIALIZED
	 */
	StatusCode Get(int64_t &value) const;

	/**
	 *	@brief	Get the value.
	 *
	 *	@return	the value.
	 *
	 *	@throw	StatusCodeException
	 */
	int64_t Get() const;

	/**
	 *	@brief	Add.
	 *
	 *	@param	rhs the value to add to this object.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_NOT_INITIALIZED
	 *	@retval	STATUS_CODE_OUT_OF_RANGE
	 */
	ACTIV_FIELD_TYPES_API StatusCode Add(const SInt &rhs);

	/**
	 *	@brief	Subtract.
	 *
	 *	@param	rhs the value to subtract from this object.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_NOT_INITIALIZED
	 *	@retval	STATUS_CODE_OUT_OF_RANGE
	 */
	ACTIV_FIELD_TYPES_API StatusCode Subtract(const SInt &rhs);

	/**
	 *	@brief	Multiply.
	 *
	 *	@param	rhs the value to multiply this object by.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_NOT_INITIALIZED
	 *	@retval	STATUS_CODE_OUT_OF_RANGE
	 */
	ACTIV_FIELD_TYPES_API StatusCode Multiply(const SInt &rhs);

	/**
	 *	@brief	Divide.
	 *
	 *	@param	rhs the value to divide this object by.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_NOT_INITIALIZED
	 *	@retval	STATUS_CODE_OUT_OF_RANGE
	 */
	ACTIV_FIELD_TYPES_API StatusCode Divide(const SInt &rhs);

	/**
	 *	@brief	Reset the object.
	 */
	virtual void Reset();

	/**
	 *	@brief	Clear the object.
	 */
	virtual void Clear();

	/**
	 *	@brief	Compare.
	 *
	 *	@param	rhs the object to compare with.
	 *	@param	result the result of the comparison.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 */
	ACTIV_FIELD_TYPES_API StatusCode Compare(const SInt &rhs, int &result) const;

	/**
	 *	@brief	Compare.
	 *
	 *	@param	pRhsSerializedBody the buffer containing the rhs serialized version of the object's body in.
	 *	@param	rhsSerializedBodyLength the rhs serialized body length.
	 *	@param	result the result of the comparison.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_INVALID_PARAMETER
	 *	@retval	...
	 */
	ACTIV_FIELD_TYPES_API virtual StatusCode Compare(const void * const pRhsSerializedBody, const size_t rhsSerializedBodyLength, int &result) const;

	/**
	 *	@brief	Convert another IFieldType object to this type.
	 *
	 *	@param	pIFieldType the value to convert from.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	...
	 */
	ACTIV_FIELD_TYPES_API virtual StatusCode Convert(const IFieldType * const pIFieldType);

	/**
	 *	@brief	Convert the object to a string.
	 *
	 *	@return	the object as a string.
	 */
	ACTIV_FIELD_TYPES_API virtual std::string ToString() const;

	/**
	 *	@brief	Convert the object from a string.
	 *
	 *	@param	messageValidator the message validator.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_INVALID_LENGTH
	 *	@retval	...
	 */
	ACTIV_FIELD_TYPES_API virtual StatusCode FromString(MessageValidator &messageValidator);

	/**
	 *	@brief	Serialize the object into the supplied message builder.
	 *
	 *	@param	messageBuilder the message builder to store a serialized version of the object in.
	 *	@param	maxSerializedBodyLength the maximum serialized body length.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_INVALID_PARAMETER
	 *	@retval	STATUS_CODE_NOT_INITIALIZED
	 *	@retval	...
	 */
	ACTIV_FIELD_TYPES_API virtual StatusCode Serialize(MessageBuilder &messageBuilder, const size_t maxSerializedBodyLength) const;

	/**
	 *	@brief	Serialize the object's body into the supplied data buffer.
	 *
	 *	@param	pSerializedBody the buffer to store a serialized version of the object's body in.
	 *	@param	maxSerializedBodyLength the maximum serialized body length.
	 *	@param	serializedBodyLength the serialized body length.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_INVALID_PARAMETER
	 *	@retval	STATUS_CODE_NOT_INITIALIZED
	 *	@retval	...
	 */
	ACTIV_FIELD_TYPES_API virtual StatusCode SerializeBody(void *pSerializedBody, const size_t maxSerializedBodyLength, size_t &serializedBodyLength) const;

	/**
	 *	@brief	Serialize the object's length and body into the supplied message builder.
	 *
	 *	@param	messageBuilder the message builder to store a serialized version of the object in.
	 *	@param	maxSerializedBodyLength the maximum serialized body length.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_INVALID_PARAMETER
	 *	@retval	STATUS_CODE_NOT_INITIALIZED
	 *	@retval	...
	 */
	ACTIV_FIELD_TYPES_API virtual StatusCode SerializeLengthAndBody(MessageBuilder &messageBuilder, const size_t maxSerializedBodyLength = MAX_SERIALIZED_BODY_LENGTH_UNDEFINED) const;

	/**
	 *	@brief	Deserialize the object from the supplied message validator.
	 *
	 *	@param	messageValidator the message validator from which the object will be extracted.
	 *	@param	maxSerializedBodyLength the maximum serialized body length.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_INVALID_PARAMETER
	 *	@retval	...
	 */
	ACTIV_FIELD_TYPES_API virtual StatusCode Deserialize(MessageValidator &messageValidator, const size_t maxSerializedBodyLength);

	/**
	 *	@brief	Deserialize the object's body from the supplied data buffer.
	 *
	 *	@param	pSerializedBody the buffer from which the object's body will be extracted.
	 *	@param	serializedBodyLength the serialized body length.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_INVALID_PARAMETER
	 *	@retval	...
	 */
	ACTIV_FIELD_TYPES_API virtual StatusCode DeserializeBody(const void * const pSerializedBody, const size_t serializedBodyLength);

	/**
	 *	@brief	Deserialize the object's length and body from the supplied message validator.
	 *
	 *	@param	messageValidator the message validator from which the object will be extracted.
	 *	@param	maxSerializedBodyLength the maximum serialized body length.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_INVALID_PARAMETER
	 *	@retval	...
	 */
	ACTIV_FIELD_TYPES_API virtual StatusCode DeserializeLengthAndBody(MessageValidator &messageValidator, const size_t maxSerializedBodyLength = MAX_SERIALIZED_BODY_LENGTH_UNDEFINED);

	/**
	 *	@brief	Get the serialized length of the object.
	 *
	 *	@return	the serialized length of the object.
	 */
	virtual size_t GetSerializedLength() const;

	/**
	 *	@brief	Get the serialized length of the object's body.
	 *
	 *	@return	the serialized length of the object's body.
	 */
	virtual size_t GetSerializedBodyLength() const;

	/**
	 *	@brief	Is different.
	 *
	 *	@param	pRhsSerializedBody the buffer containing the rhs serialized version of the object's body in.
	 *	@param	rhsSerializedBodyLength the rhs serialized body length.
	 *	@param	isDifferent indicates whether the two objects are different.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_INVALID_PARAMETER
	 *	@retval	...
	 */
	ACTIV_FIELD_TYPES_API virtual StatusCode IsDifferent(const void * const pRhsSerializedBody, const size_t rhsSerializedBodyLength, bool &isDifferent) const;

	/**
	 *	@brief	Get the maximum serialized length of the object.
	 *
	 *	@param	size the size of the data.
	 *
	 *	@return	the maximum serialized length of the object.
	 */
	static size_t GetMaxSerializedLength(const size_t size);

	/**
	 *	@brief	Get the maximum serialized length of the object's body.
	 *
	 *	@param	size the size of the data.
	 *
	 *	@return	the maximum serialized length of the object's body.
	 */
	static size_t GetMaxSerializedBodyLength(const size_t size);

	/**
	 *	@brief	Compare two objects serialized bodies.
	 *
	 *	@param	pLhsSerializedBody the buffer containing the lhs serialized version of the object's body in.
	 *	@param	lhsSerializedBodyLength the lhs serialized body length.
	 *	@param	pRhsSerializedBody the buffer containing the rhs serialized version of the object's body in.
	 *	@param	rhsSerializedBodyLength the rhs serialized body length.
	 *	@param	result the result of the comparison.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_INVALID_PARAMETER
	 */
	ACTIV_FIELD_TYPES_API static StatusCode Compare(const void * const pLhsSerializedBody, const size_t lhsSerializedBodyLength, const void * const pRhsSerializedBody, const size_t rhsSerializedBodyLength, int &result);

	/**
	 *	@brief	Validate the serialized length and body.
	 *
	 *	@param	messageValidator the message validator.
	 *	@param	serializedBodyOffset the serialized body offset.
	 *	@param	serializedBodyLength the serialized body length.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_INVALID_PARAMETER
	 *	@retval	...
	 */
	ACTIV_FIELD_TYPES_API static StatusCode ValidateSerializedLengthAndBody(MessageValidator &messageValidator, size_t &serializedBodyOffset, size_t &serializedBodyLength);

	/**
	 *	@brief	Is valid serialized body length.
	 *
	 *	@param	serializedBodyLength the serialized body length.
	 *
	 *	@return	whether the serialized body length is valid.
	 */
	static bool IsValidSerializedBodyLength(const size_t serializedBodyLength);

private:
	/**
	 *	@brief	Get the compressed value size.
	 *
	 *	@return	the compressed value size.
	 */
	size_t GetCompressedValueSize() const;

	/**
	 *	@brief	Serialize the object's body into the supplied data buffer.
	 *
	 *	This will serialize to a fixed size buffer (GetMaxSerializedLength<T>()).
	 *
	 *	@param	pSerializedBody the buffer to store a serialized version of the object in.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 */
	template <typename T> StatusCode SerializeBody(void *pSerializedBody) const;

	/**
	 *	@brief	Deserialize the object's body from the supplied data buffer.
	 *
	 *	This will deserialize from a fixed size buffer (GetMaxSerializedLength<T>()).
	 *
	 *	@param	pSerializedBody the buffer from which the object will be extracted.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_INVALID_FORMAT
	 *	@retval	STATUS_CODE_INVALID_PARAMETER
	 *	@retval	STATUS_CODE_OUT_OF_RANGE
	 */
	template <typename T> StatusCode DeserializeBody(const void * const pSerializedBody);

	/**
	 *	@brief	Get a signed 64 bit value.
	 *
	 *	@param	pData pointer to the data.
	 *	@param	size the size of the data.
	 *	@param	value the value to be copied to.
	 *
	 *	@retval	STATUS_CODE_SUCCESS
	 *	@retval	STATUS_CODE_INVALID_PARAMETER
	 */
	static StatusCode GetSignedInt64(const void * const pData, const size_t size, int64_t &value);

	int64_t	m_value;	///< The value.
};

// ---------------------------------------------------------------------------------------------------------------------------------

inline SInt::SInt() :
	IFieldType(FIELD_TYPE)
{
	m_isInitialized = false;
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline SInt::SInt(const int64_t value) :
	IFieldType(FIELD_TYPE)
{
	(void) Set(value);
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline SInt::~SInt()
{
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline bool SInt::operator==(const SInt &rhs) const
{
	int result;
	ACTIV_THROW_RESULT_IF(STATUS_CODE_SUCCESS, !=, Compare(rhs, result));

	return (0 == result);
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline bool SInt::operator!=(const SInt &rhs) const
{
	return !((*this) == rhs);
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline bool SInt::operator<(const SInt &rhs) const
{
	int result;
	ACTIV_THROW_RESULT_IF(STATUS_CODE_SUCCESS, !=, Compare(rhs, result));

	return (result < 0);
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline bool SInt::operator<=(const SInt &rhs) const
{
	return !((*this) > rhs);
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline bool SInt::operator>(const SInt &rhs) const
{
	int result;
	ACTIV_THROW_RESULT_IF(STATUS_CODE_SUCCESS, !=, Compare(rhs, result));

	return (result > 0);
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline bool SInt::operator>=(const SInt &rhs) const
{
	return !((*this) < rhs);
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline SInt& SInt::operator+=(const SInt &rhs)
{
	ACTIV_THROW_RESULT_IF(STATUS_CODE_SUCCESS, !=, Add(rhs));

	return (*this);
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline SInt& SInt::operator-=(const SInt &rhs)
{
	ACTIV_THROW_RESULT_IF(STATUS_CODE_SUCCESS, !=, Subtract(rhs));

	return (*this);
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline SInt& SInt::operator*=(const SInt &rhs)
{
	ACTIV_THROW_RESULT_IF(STATUS_CODE_SUCCESS, !=, Multiply(rhs));

	return (*this);
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline SInt& SInt::operator/=(const SInt &rhs)
{
	ACTIV_THROW_RESULT_IF(STATUS_CODE_SUCCESS, !=, Divide(rhs));

	return (*this);
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline StatusCode SInt::Set(const int64_t value)
{
	m_value = value;
	m_isInitialized = true;

	return STATUS_CODE_SUCCESS;
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline StatusCode SInt::Get(int64_t &value) const
{
	if (!IsInitialized())
		return STATUS_CODE_NOT_INITIALIZED;

	value = m_value;

	return STATUS_CODE_SUCCESS;
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline int64_t SInt::Get() const
{
	if (!IsInitialized())
		ACTIV_THROW(StatusCodeException, STATUS_CODE_NOT_INITIALIZED);

	return m_value;
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline void SInt::Reset()
{
	m_isInitialized = false;
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline void SInt::Clear()
{
	m_isInitialized = false;
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline size_t SInt::GetSerializedLength() const
{
	return (IsInitialized() ? GetMaxSerializedLength(GetCompressedValueSize()) : 0);
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline size_t SInt::GetSerializedBodyLength() const
{
	return (IsInitialized() ? GetMaxSerializedBodyLength(GetCompressedValueSize()) : 0);
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline size_t SInt::GetMaxSerializedLength(const size_t size)
{
	return GetMaxSerializedBodyLength(size);
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline size_t SInt::GetMaxSerializedBodyLength(const size_t size)
{
	return size;
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline bool SInt::IsValidSerializedBodyLength(const size_t serializedBodyLength)
{
	return ((GetMaxSerializedBodyLength(sizeof(int64_t)) == serializedBodyLength) || (GetMaxSerializedBodyLength(sizeof(int32_t)) == serializedBodyLength) || (GetMaxSerializedBodyLength(sizeof(int16_t)) == serializedBodyLength) || (GetMaxSerializedBodyLength(sizeof(int8_t)) == serializedBodyLength));
}

// ---------------------------------------------------------------------------------------------------------------------------------

inline size_t SInt::GetCompressedValueSize() const
{
	if ((m_value >= INT8_MIN) && (m_value <= INT8_MAX))
		return sizeof(int8_t);

	if ((m_value >= INT16_MIN) && (m_value <= INT16_MAX))
		return sizeof(int16_t);

	if ((m_value >= INT32_MIN) && (m_value <= INT32_MAX))
		return sizeof(int32_t);

	return sizeof(int64_t);
}

// ---------------------------------------------------------------------------------------------------------------------------------

template <typename T> inline StatusCode SInt::SerializeBody(void *pSerializedBody) const
{
	CopyValueToUnalignedPointer<T>(pSerializedBody, static_cast<T>(m_value));

#if !defined(ACTIV_LITTLE_ENDIAN)
	MemoryReverse(pSerializedBody, sizeof(T));
#endif

	return STATUS_CODE_SUCCESS;
}

// ---------------------------------------------------------------------------------------------------------------------------------

template <typename T> inline StatusCode SInt::DeserializeBody(const void * const pSerializedBody)
{
	int64_t value = static_cast<int64_t>(GetValueFromUnalignedPointer<T>(pSerializedBody));

#if !defined(ACTIV_LITTLE_ENDIAN)
	MemoryReverse(&value, sizeof(value));
#endif

	return Set(value);
}

// ---------------------------------------------------------------------------------------------------------------------------------

/**
 *	@brief	Addition operator for the signed integer object.
 *
 *	@param	lhs the left hand side value.
 *	@param	rhs the right hand side value.
 *
 *	@return	an object containing the result of the operation.
 *
 *	@throw	StatusCodeException
 */
inline const SInt operator+(const SInt &lhs, const SInt &rhs)
{
	return SInt(lhs) += rhs;
}

// ---------------------------------------------------------------------------------------------------------------------------------

/**
 *	@brief	Subtraction operator for the signed integer object.
 *
 *	@param	lhs the left hand side value.
 *	@param	rhs the right hand side value.
 *
 *	@return	an object containing the result of the operation.
 *
 *	@throw	StatusCodeException
 */
inline const SInt operator-(const SInt &lhs, const SInt &rhs)
{
	return SInt(lhs) -= rhs;
}

// ---------------------------------------------------------------------------------------------------------------------------------

/**
 *	@brief	Multiplication operator for the signed integer object.
 *
 *	@param	lhs the left hand side value.
 *	@param	rhs the right hand side value.
 *
 *	@return	an object containing the result of the operation.
 *
 *	@throw	StatusCodeException
 */
inline const SInt operator*(const SInt &lhs, const SInt &rhs)
{
	return SInt(lhs) *= rhs;
}

// ---------------------------------------------------------------------------------------------------------------------------------

/**
 *	@brief	Division operator for the signed integer object.
 *
 *	@param	lhs the left hand side value.
 *	@param	rhs the right hand side value.
 *
 *	@return	an object containing the result of the operation.
 *
 *	@throw	StatusCodeException
 */
inline const SInt operator/(const SInt &lhs, const SInt &rhs)
{
	return SInt(lhs) /= rhs;
}

} // namespace Activ

#endif // !defined (ACTIV_SINT_H)
