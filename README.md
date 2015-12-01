# FitAura

## API

**POST /api/v1/users/ with {user: {name: "Name", email: "Email", password: "Password", password_confirmation: "Password" } }**

Returns: {id: user.id, email: user.email, user_token: user.authenication_token }

Creates user with specified name, email and password. Returns auth token or error if user creation has failed.

**GET /api/v1/users/#{id} with { password: "Password" }**

Returns: { email: user.email, user_token: user.authenication_token }

Retrieves user auth token. Returns auth token and email, or error if user authenication has failed.

#### All other API commands take user_token and email for authenication, which can be either send in the header or in the request.

**GET /api/v1/trainers/ with { user_email: Email, user_token: Token }**

Returns: { trainers: { } }

Retrieves trainers. 

## Schema Information

 Table name: `bookings`

  Columns

 Name                | Type               | Attributes
 ------------------- | ------------------ | ---------------------------
 **`id`**            | `integer`          | `not null, primary key`
 **`user_id`**       | `integer`          |
 **`timeslot_id`**   | `integer`          |
 **`created_at`**    | `datetime`         | `not null`
 **`updated_at`**    | `datetime`         | `not null`
 **`booking_date`**  | `date`             |

  Schema Information

 Table name: `certificates`

  Columns

 Name               | Type               | Attributes
 ------------------ | ------------------ | ---------------------------
 **`id`**           | `integer`          | `not null, primary key`
 **`trainer_id`**   | `integer`          |
 **`title`**        | `string`           |
 **`description`**  | `string`           |
 **`created_at`**   | `datetime`         | `not null`
 **`updated_at`**   | `datetime`         | `not null`

  Schema Information

 Table name: `instructors`

  Columns

 Name                      | Type               | Attributes
 ------------------------- | ------------------ | ---------------------------
 **`id`**                  | `integer`          | `not null, primary key`
 **`name`**                | `string`           |
 **`about`**               | `string`           |
 **`studio_id`**           | `integer`          |
 **`created_at`**          | `datetime`         | `not null`
 **`updated_at`**          | `datetime`         | `not null`
 **`photo_file_name`**     | `string`           |
 **`photo_content_type`**  | `string`           |
 **`photo_file_size`**     | `integer`          |
 **`photo_updated_at`**    | `datetime`         |

  Schema Information

 Table name: `locations`

  Columns

 Name              | Type               | Attributes
 ----------------- | ------------------ | ---------------------------
 **`id`**          | `integer`          | `not null, primary key`
 **`trainer_id`**  | `integer`          |
 **`title`**       | `string`           |
 **`address1`**    | `string`           |
 **`address2`**    | `string`           |
 **`zipcode`**     | `string`           |
 **`default`**     | `boolean`          |
 **`created_at`**  | `datetime`         | `not null`
 **`updated_at`**  | `datetime`         | `not null`
 **`latitude`**    | `float`            |
 **`longitude`**   | `float`            |

  Schema Information

 Table name: `studios`

  Columns

 Name                          | Type               | Attributes
 ----------------------------- | ------------------ | ---------------------------
 **`id`**                      | `integer`          | `not null, primary key`
 **`email`**                   | `string`           | `default(""), not null`
 **`encrypted_password`**      | `string`           | `default(""), not null`
 **`reset_password_token`**    | `string`           |
 **`reset_password_sent_at`**  | `datetime`         |
 **`remember_created_at`**     | `datetime`         |
 **`sign_in_count`**           | `integer`          | `default(0), not null`
 **`current_sign_in_at`**      | `datetime`         |
 **`last_sign_in_at`**         | `datetime`         |
 **`current_sign_in_ip`**      | `string`           |
 **`last_sign_in_ip`**         | `string`           |
 **`created_at`**              | `datetime`         | `not null`
 **`updated_at`**              | `datetime`         | `not null`
 **`name`**                    | `string`           |
 **`zipcode`**                 | `string`           |
 **`phone`**                   | `string`           |
 **`address1`**                | `string`           |
 **`address2`**                | `string`           |
 **`logo_file_name`**          | `string`           |
 **`logo_content_type`**       | `string`           |
 **`logo_file_size`**          | `integer`          |
 **`logo_updated_at`**         | `datetime`         |
 **`studio_name`**             | `string`           |
 **`latitude`**                | `float`            |
 **`longitude`**               | `float`            |

   Include default devise modules. Others available are:
   :confirmable, :lockable, :timeoutable and :omniauthable
    "{id}-{studio_name.parameterize}"
  Schema Information

 Table name: `studio_classes`

  Columns

 Name                   | Type               | Attributes
 ---------------------- | ------------------ | ---------------------------
 **`id`**               | `integer`          | `not null, primary key`
 **`studio_id`**        | `integer`          |
 **`name`**             | `string`           |
 **`description`**      | `text`             |
 **`points`**           | `integer`          |
 **`created_at`**       | `datetime`         | `not null`
 **`updated_at`**       | `datetime`         | `not null`
 **`instructor_name`**  | `string`           |
 **`instructor_id`**    | `integer`          |

    "{id}-{name.parameterize}"
  Schema Information

 Table name: `testimonials`

  Columns

 Name               | Type               | Attributes
 ------------------ | ------------------ | ---------------------------
 **`id`**           | `integer`          | `not null, primary key`
 **`trainer_id`**   | `integer`          |
 **`name`**         | `string`           |
 **`testimonial`**  | `text`             |
 **`created_at`**   | `datetime`         | `not null`
 **`updated_at`**   | `datetime`         | `not null`

  Schema Information

 Table name: `timeslots`

  Columns

 Name                     | Type               | Attributes
 ------------------------ | ------------------ | ---------------------------
 **`id`**                 | `integer`          | `not null, primary key`
 **`days`**               | `text`             | `default([]), is an Array`
 **`start_time`**         | `time`             |
 **`duration`**           | `integer`          |
 **`created_at`**         | `datetime`         | `not null`
 **`updated_at`**         | `datetime`         | `not null`
 **`start_date`**         | `date`             |
 **`end_date`**           | `date`             |
 **`capacity`**           | `integer`          | `default(1)`
 **`scheduleable_id`**    | `integer`          |
 **`scheduleable_type`**  | `string`           |

  Schema Information

 Table name: `trainers`

  Columns

 Name                          | Type               | Attributes
 ----------------------------- | ------------------ | ---------------------------
 **`id`**                      | `integer`          | `not null, primary key`
 **`email`**                   | `string`           | `default(""), not null`
 **`encrypted_password`**      | `string`           | `default(""), not null`
 **`reset_password_token`**    | `string`           |
 **`reset_password_sent_at`**  | `datetime`         |
 **`remember_created_at`**     | `datetime`         |
 **`sign_in_count`**           | `integer`          | `default(0), not null`
 **`current_sign_in_at`**      | `datetime`         |
 **`last_sign_in_at`**         | `datetime`         |
 **`current_sign_in_ip`**      | `string`           |
 **`last_sign_in_ip`**         | `string`           |
 **`created_at`**              | `datetime`         | `not null`
 **`updated_at`**              | `datetime`         | `not null`
 **`name`**                    | `string`           |
 **`zipcode`**                 | `string`           |
 **`photo_file_name`**         | `string`           |
 **`photo_content_type`**      | `string`           |
 **`photo_file_size`**         | `integer`          |
 **`photo_updated_at`**        | `datetime`         |
 **`latitude`**                | `float`            |
 **`longitude`**               | `float`            |
 **`about`**                   | `text`             |
 **`phone`**                   | `string`           |
 **`confirmation_token`**      | `string`           |
 **`confirmed_at`**            | `datetime`         |
 **`confirmation_sent_at`**    | `datetime`         |
 **`sex`**                     | `string`           |
 **`specialty`**               | `string`           |
 **`years_of_experience`**     | `string`           |

   Include default devise modules. Others available are:
   :confirmable, :lockable, :timeoutable and :omniauthable
  Schema Information

 Table name: `trainer_classes`

  Columns

 Name               | Type               | Attributes
 ------------------ | ------------------ | ---------------------------
 **`id`**           | `integer`          | `not null, primary key`
 **`trainer_id`**   | `integer`          |
 **`name`**         | `string`           |
 **`description`**  | `text`             |
 **`semiprivate`**  | `boolean`          | `default(FALSE)`
 **`created_at`**   | `datetime`         | `not null`
 **`updated_at`**   | `datetime`         | `not null`
 **`points`**       | `integer`          |
 **`location_id`**  | `integer`          |

  Schema Information

 Table name: `trainer_formats`

  Columns

 Name                      | Type               | Attributes
 ------------------------- | ------------------ | ---------------------------
 **`id`**                  | `integer`          | `not null, primary key`
 **`training_format_id`**  | `integer`          |
 **`trainer_id`**          | `integer`          |
 **`created_at`**          | `datetime`         | `not null`
 **`updated_at`**          | `datetime`         | `not null`

  Schema Information

 Table name: `training_formats`

  Columns

 Name               | Type               | Attributes
 ------------------ | ------------------ | ---------------------------
 **`id`**           | `integer`          | `not null, primary key`
 **`name`**         | `string`           |
 **`description`**  | `string`           |
 **`created_at`**   | `datetime`         | `not null`
 **`updated_at`**   | `datetime`         | `not null`

  Schema Information

 Table name: `users`

  Columns

 Name                          | Type               | Attributes
 ----------------------------- | ------------------ | ---------------------------
 **`id`**                      | `integer`          | `not null, primary key`
 **`email`**                   | `string`           | `default(""), not null`
 **`encrypted_password`**      | `string`           | `default(""), not null`
 **`reset_password_token`**    | `string`           |
 **`reset_password_sent_at`**  | `datetime`         |
 **`remember_created_at`**     | `datetime`         |
 **`sign_in_count`**           | `integer`          | `default(0), not null`
 **`current_sign_in_at`**      | `datetime`         |
 **`last_sign_in_at`**         | `datetime`         |
 **`current_sign_in_ip`**      | `string`           |
 **`last_sign_in_ip`**         | `string`           |
 **`created_at`**              | `datetime`         | `not null`
 **`updated_at`**              | `datetime`         | `not null`
 **`name`**                    | `string`           |
 **`zipcode`**                 | `string`           |
 **`points`**                  | `integer`          | `default(0)`
 **`authentication_token`**    | `string`           |


