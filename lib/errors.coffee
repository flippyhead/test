class ApplicationError
	constructor: (@message) ->
		Error.call this, @message
		Error.captureStackTrace this, arguments.callee

class AccessDeniedError extends ApplicationError
class AuthorizationFailedError extends ApplicationError
class DocumentNotFoundError extends ApplicationError
class DocumentExistsError extends ApplicationError

exports.DocumentNotFoundError = DocumentNotFoundError
exports.DocumentExistsError = DocumentExistsError
exports.AccessDeniedError = AccessDeniedError
exports.AuthorizationFailedError = AuthorizationFailedError