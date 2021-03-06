defmodule ElixirAmi.Message do
  @moduledoc """
  A small abstraction over the message received from Asterisk. Tells apart
  responses from events.

  See: https://wiki.asterisk.org/wiki/display/AST/The+Asterisk+Manager+TCP+IP+API

  Copyright 2015 Marcelo Gornstein <marcelog@gmail.com>

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  """
  alias ElixirAmi.Event, as: Event
  alias ElixirAmi.Response, as: Response

  @doc """
  Unserializes a response or an event based on the list of lines given.
  """
  @spec unserialize(atom, iolist) :: Event.t | Response.t
  def unserialize(source, data = ["Response:" <> _rest| _]) do
    Response.unserialize source, data
  end

  def unserialize(source, data) do
    Event.unserialize source, data
  end
end
